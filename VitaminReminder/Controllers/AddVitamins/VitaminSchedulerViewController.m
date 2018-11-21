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
#import "VitaminFrequencyViewModel.h"

@interface VitaminSchedulerViewController ()

@property (strong, nonatomic) IBOutlet UIButton *nextAccessoryButton;
@property (nonatomic, weak) id <VitaminSchedulerViewControllerDelegate> delegate;
@property (nonatomic, strong) VitaminSchedulerViewModel *viewModel;

@end

@implementation VitaminSchedulerViewController

// TODO: should be initialized with a view model instead
- (instancetype)initWithDelegate:(id <VitaminSchedulerViewControllerDelegate>)delegate
                vitaminDataModel:(VitaminDataModel *)vitaminDataModel {
    self = [super init];
    if (self) {
        self.delegate = delegate;
        // TODO: should be initiated with vitamin data model?
//        VitaminDataModel *vitaminDataModel = [VitaminDataModel new];
//        vitaminDataModel.name = vitaminName;
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
//    self.tableView.separatorColor = self.tableView.backgroundColor;
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
                                                  atIndexPath:indexPath
                                                     delegate:self];;
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
    
    // TODO: tell the delegate
    DaysDataModel *daysDataModel = self.viewModel.daysDataModel;
    // TODO: inform the delegate
    if (indexPath.section == 0 && indexPath.row == 0) {
        // TODO: should open a new view controller
        // Create vitamin frequency view model
        VitaminFrequencyViewModel *vitaminFrequencyViewModel = [[VitaminFrequencyViewModel alloc] initWithDaysDataModel:daysDataModel];
        FrequencyTableViewController *viewController = [[FrequencyTableViewController alloc] initWithDelegate:self viewModel:vitaminFrequencyViewModel];
        [self.navigationController pushViewController:viewController animated:YES];        
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
    return [self.viewModel validate];
}


#pragma mark - Actions

- (IBAction)onNextClicked:(id)sender {
    BOOL isValid = [self validate];
    if (!isValid) {
        [self showAlert];
    } else {
        VitaminDataModel *updatedVitaminDataModel = [self.viewModel updatedVitaminDataModel];
        [self.delegate onVitaminSchedulerNextClickedWithVitaminDataModel:updatedVitaminDataModel];
        // Call the delegate
        // get the updated vitamin data model from the view model?
        
        
        // TODO: call the delegate with the vitamin
//        NSString *vitaminName = self.vitaminName;
//        [self.delegate onVitaminPropertiesNextClickedWithVitaminName:vitaminName];
    }
}

- (void)showAlert {
    VitaminSchedulerViewControllerError error = [self.viewModel errorType];
    NSString *message = [self getMessageForError:error];
    [UIAlertController showAlertInViewController:self
                                           title:@"Error"
                                         message:message
                                          button:@"OK"];
}

- (NSString *)getMessageForError:(VitaminSchedulerViewControllerError)error {
    switch (error) {
        case VitaminSchedulerViewControllerErrorFrequencyUndefined:
            return @"Please select at least one day.";
        case VitaminSchedulerViewControllerErrorDosagesUndefined:
            return @"Please add at least one dosage.";
        default:
            return @"Please try again.";
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - FrequencyTableViewControllerDelegate

- (void)onFrequencyUpdatedWithDaysDataModel:(DaysDataModel *)daysDataModel {
    [self.viewModel updateDaysDataModel:daysDataModel];
    [self.tableView reloadData];
}

#pragma mark - DosagesTableViewCellDelegate

- (void)onAddDosageClicked {
    NSLog(@"on add dosage clicked");
    
    DosageViewController *dosageViewController = [[DosageViewController alloc] initWithDelegate:self];
    dosageViewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    dosageViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:dosageViewController animated:YES completion:nil];
    // TODO: show the view controller implement
    
    // Show the view controller
    // Inform the view controller
}

- (void)onRemoveDosageClickedWithIndex:(NSInteger)index {
    NSLog(@"on remove dosage clicked with index: %@", @(index));
    
    // TODO: should tell the view model that we've removed one of the dosages, should probably reload the data
    [self.viewModel removeDosageAtIndex:index];
    // Reload the table view?
    [self.tableView reloadData];
    
    // TODO: it still creates a new dosage
    [self.tableView layoutIfNeeded];
    
}

#pragma mark - DosageViewControllerDelegate

- (void)onAddDosageClickedWithDosageDataModel:(DosageDataModel *)dosageDataModel {
    NSLog(@"dosage will be added: %@", dosageDataModel);
    
    // Add dosage and reload the table view?
    // We cannot
    // We have to add it here!
    [self.viewModel addDosageDataModel:dosageDataModel];
    [self.tableView reloadData];
    
    // TODO: it still creates a new dosage
    
}

// TODO: change method
//- (void)onAddDosageClickedWithDosage:(Dosage *)dosage

@end
