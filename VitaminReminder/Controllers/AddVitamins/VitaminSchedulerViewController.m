//
//  VitaminSchedulerViewController.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-20.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "VitaminSchedulerViewController.h"
#import "UIView+Utils.h"
#import "VitaminSchedulerViewModel.h"
#import "UIAlertController+Utils.h"

@interface VitaminSchedulerViewController ()

@property (strong, nonatomic) IBOutlet UIButton *nextAccessoryButton;
@property (nonatomic, weak) id <VitaminSchedulerViewControllerDelegate> delegate;
@property (nonatomic, strong) VitaminSchedulerViewModel *viewModel;

@end

@implementation VitaminSchedulerViewController

// TODO: should be initialized with a view model instead
- (instancetype)initWithDelegate:(id <VitaminSchedulerViewControllerDelegate>)delegate
                     vitaminName:(NSString *)vitaminName {
    self = [super init];
    if (self) {
        self.delegate = delegate;
        // TODO: should be initiated with vitamin data model?
        VitaminDataModel *vitaminDataModel = [VitaminDataModel new];
        vitaminDataModel.name = vitaminName;
        self.viewModel = [[VitaminSchedulerViewModel alloc] initWithVitaminDataModel:vitaminDataModel];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
    [self setupTableView];
//    self.viewModel registerNibForTableView:self.tableView cellViewModel:<#(CellViewModel *)#>
    //    self.titleLabelText = @"Vitamin scheduler";
    //    self.rightBarButtonTitle = @"Next";
    
    // Do any additional setup after loading the view.
}

- (void)setupNavigationBar {
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar addShadow];
    //    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(onRightBarButtonClicked)];
    // TODO add
    //    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    //    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    self.title = @"Schedule";
}

- (void)setupTableView {
    [self.viewModel registerNibForTableView:self.tableView];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 140;
    self.tableView.separatorColor = self.tableView.backgroundColor;
}

- (UIView *)inputAccessoryView {
    return self.nextAccessoryButton;
}


- (BOOL)canBecomeFirstResponder {
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.viewModel.numberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.viewModel dequeueAndConfigureCellInTableView:tableView
                                                  atIndexPath:indexPath];;
}

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


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // if the index path -> is the first one
    // Check the frequency clicked -> days data model
    // TODO:
    DaysDataModel *daysDataModel = self.viewModel.vitaminDataModel.days;
    // TODO: inform the delegate
    if (indexPath.row == 0) {
        // TODO: should open a new view controller
    }
    // Navigation logic may go here, for example:
    // Create the next view controller.
//    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
//
//    // Pass the selected object to the new view controller.
//
//    // Push the view controller.
//    [self.navigationController pushViewController:detailViewController animated:YES];
}


- (BOOL)validate {
    // TODO
    return YES;
}

#pragma mark - Actions

- (IBAction)onNextClicked:(id)sender {
    BOOL isValid = [self validate];
    if (!isValid) {
        [self showAlert];
    } else {
        // TODO: call the delegate with the vitamin
//        NSString *vitaminName = self.vitaminName;
//        [self.delegate onVitaminPropertiesNextClickedWithVitaminName:vitaminName];
    }
}

- (void)showAlert {
    [UIAlertController showAlertInViewController:self
                                           title:@"Error"
                                         message:@"Please enter a vitamin name"
                                          button:@"OK"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
