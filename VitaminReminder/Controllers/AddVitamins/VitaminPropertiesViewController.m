//
//  VitaminPropertiesViewController.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-19.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "VitaminPropertiesViewController.h"
#import "TextEntryTableViewCell.h"
#import "UIView+Utils.h"
#import "UIAlertController+Utils.h"

@interface VitaminPropertiesViewController()

@property (nonatomic, strong) VitaminPropertiesViewModel *viewModel;
@property (weak, nonatomic) id <VitaminPropertiesViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIButton *nextAccessoryButton;


@end

// TODO: maybe change the view modfel here instead?
@implementation VitaminPropertiesViewController

// TODO: USE this method when we want to initalize a new view vitamin
- (instancetype)initWithDelegate:(id <VitaminPropertiesViewControllerDelegate>)delegate {
    self = [super init];
    if (self) {
        self.delegate = delegate;
        self.viewModel = [[VitaminPropertiesViewModel alloc] init];
    }
    return self;
}

// TODO: use this method when we want to edit a previous vitamin
- (instancetype)initWithDelegate:(id <VitaminPropertiesViewControllerDelegate>)delegate vitaminDataModel:(VitaminDataModel *)vitaminDataModel {
    self = [super init];
    if (self) {
        self.delegate = delegate;
        self.viewModel = [[VitaminPropertiesViewModel alloc] initWithVitaminDataModel:vitaminDataModel];
    }
    return self;
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (UIView *)inputAccessoryView {
    return self.nextAccessoryButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self setupNavigationBar];

//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
//    [self.view addGestureRecognizer:tap];
}

- (void)setupNavigationBar {
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar addShadow];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(onLeftBarButtonClicked)];
//    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(onRightBarButtonClicked)];
    // TODO add
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
//    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    self.title = self.viewModel.isEditingVitamin ? @"Edit vitamin" : @"Add vitamin";
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}

- (void)setupTableView {
    // TODO: replace with the model
    [self.viewModel registerNibForTableView:self.tableView];
//    UINib *nib = [UINib nibWithNibName:TextEntryTableViewCell.nibName bundle:nil] ;
//    NSString *reuseIdentifier = TextEntryTableViewCell.reuseIdentifier;
//    [self.tableView registerNib:nib forCellReuseIdentifier:reuseIdentifier];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 140;
//    self.tableView.separatorColor = self.tableView.backgroundColor;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfRowsInSection:section];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell isKindOfClass:[TextEntryTableViewCell class]] && indexPath.row == 0) {
        TextEntryTableViewCell *textEntryCell = (TextEntryTableViewCell *)cell;
        [textEntryCell.valueTextField becomeFirstResponder];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // the cell should be dequeued based on the reusd
    return [self.viewModel dequeueAndConfigureCellInTableView:tableView atIndexPath:indexPath delegate:self];
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// todo do we need these?
- (BOOL)validate {
    return self.viewModel.validateVitaminProperties;
}

- (NSString *)vitaminName {
    return self.viewModel.vitaminName;
}

- (void)onLeftBarButtonClicked {
    //tell the coordinator delegate
    [self.delegate onVitaminPropertiesCancelClicked];
    //    [self dismissViewControllerAnimated:YES completion:nil];
}

//- (void)onNextClicked {
//    BOOL isValid = [self validate];
//    if (!isValid) {
//        [self showAlert];
//    } else {
//        NSString *vitaminName = self.vitaminName;
//        [self.delegate onVitaminPropertiesNextClickedWithVitaminName:vitaminName];
//    }
//}
- (IBAction)onNextClicked:(id)sender {
    BOOL isValid = [self validate];
    if (!isValid) {
        [self showAlert];
    } else {
//        NSString *vitaminName = self.vitaminName;
        VitaminDataModel *vitaminDataModel = [self.viewModel updatedVitaminDataModel];
        [self.delegate onVitaminPropertiesNextClickedWithVitaminDataModel:vitaminDataModel];
    }
}

- (void)showAlert {
    [UIAlertController showAlertInViewController:self
                                           title:@"Error"
                                         message:@"Please enter a vitamin name"
                                          button:@"OK"];
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //
    // Call the next

    [self onNextClicked:textField];
    return YES;
}

// TODO: remove
//- (void)dismissKeyboard {
//    [self.tableView resignFirstResponder];
////    self.tableView.visibleCells
//}
//
@end
