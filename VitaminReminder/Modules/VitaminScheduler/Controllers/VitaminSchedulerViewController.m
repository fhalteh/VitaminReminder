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

- (instancetype)initWithDelegate:(id <VitaminSchedulerViewControllerDelegate>)delegate
                vitaminDataModel:(VitaminDataModel *)vitaminDataModel {
    self = [super init];
    if (self) {
        self.delegate = delegate;
        self.viewModel = [[VitaminSchedulerViewModel alloc] initWithVitaminDataModel:vitaminDataModel];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
    [self setupTableView];
}

- (void)setupNavigationBar {
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar addShadow];
    self.title = @"Schedule";
}

- (void)setupTableView {
    [self.viewModel registerNibForTableView:self.tableView];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 140;
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DaysDataModel *daysDataModel = self.viewModel.daysDataModel;
    if (indexPath.section == 0 && indexPath.row == 0) {
        VitaminFrequencyViewModel *vitaminFrequencyViewModel = [[VitaminFrequencyViewModel alloc] initWithDaysDataModel:daysDataModel];
        FrequencyTableViewController *viewController = [[FrequencyTableViewController alloc] initWithDelegate:self viewModel:vitaminFrequencyViewModel];
        [self.navigationController pushViewController:viewController animated:YES];        
    }
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

#pragma mark - FrequencyTableViewControllerDelegate

- (void)onFrequencyUpdatedWithDaysDataModel:(DaysDataModel *)daysDataModel {
    [self.viewModel updateDaysDataModel:daysDataModel];
    [self.tableView reloadData];
}

#pragma mark - DosagesTableViewCellDelegate

- (void)onAddDosageClicked {
    DosageViewController *dosageViewController = [[DosageViewController alloc] initWithDelegate:self];
    dosageViewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    dosageViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:dosageViewController animated:YES completion:nil];
}

- (void)onRemoveDosageClickedWithIndex:(NSInteger)index {
    [self.viewModel removeDosageAtIndex:index];
    [self.tableView reloadData];
}

#pragma mark - DosageViewControllerDelegate

- (void)onAddDosageClickedWithDosageDataModel:(DosageDataModel *)dosageDataModel {
    [self.viewModel addDosageDataModel:dosageDataModel];
    [self.tableView reloadData];
}

@end
