//
//  FrequencyTableViewController.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-21.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "FrequencyTableViewController.h"
#import "VitaminFrequencyViewModel.h"
#import "WeekdaySelectionCellViewModel.h"

@interface FrequencyTableViewController ()

@property (nonatomic, strong) VitaminFrequencyViewModel *viewModel;
@property (nonatomic, weak) id <FrequencyTableViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIView *sectionHeader;

@end

@implementation FrequencyTableViewController

- (instancetype)initWithDelegate:(id <FrequencyTableViewControllerDelegate>)delegate
                       viewModel:(VitaminFrequencyViewModel *)viewModel {
    self = [super init];
    if (self) {
        self.delegate = delegate;
        self.viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    self.title = @"Frequency";
}


- (void)setupTableView {
    [self.viewModel registerNibForTableView:self.tableView];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 140;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    DaysDataModel *daysDataModel = [self.viewModel updatedDaysDataModel];
    [self.delegate onFrequencyUpdatedWithDaysDataModel:daysDataModel];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.numberOfRows;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 71;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 80;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return self.sectionHeader;
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.viewModel dequeueAndConfigureCellInTableView:tableView
                                                  atIndexPath:indexPath];;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    WeekdaySelectionCellViewModel *cellViewModel = [self.viewModel cellViewModelAtIndexPath:indexPath];
    cellViewModel.selected = !cellViewModel.selected;
//    [self.viewModel updateWeekday:cellViewModel.weekday selected:cellViewModel.selected];
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark - Actions

- (IBAction)onSelectAllClicked:(id)sender {
    [self.viewModel selectAll];
    [self.tableView reloadData];
    
}


@end
