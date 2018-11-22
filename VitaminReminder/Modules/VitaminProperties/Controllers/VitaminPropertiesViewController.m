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

@implementation VitaminPropertiesViewController

- (instancetype)initWithDelegate:(id <VitaminPropertiesViewControllerDelegate>)delegate {
    self = [super init];
    if (self) {
        self.delegate = delegate;
        self.viewModel = [[VitaminPropertiesViewModel alloc] init];
    }
    return self;
}

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
}

- (void)setupNavigationBar {
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar addShadow];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(onLeftBarButtonClicked)];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    self.title = self.viewModel.isEditingVitamin ? @"Edit vitamin" : @"Add vitamin";
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}

- (void)setupTableView {
    [self.viewModel registerNibForTableView:self.tableView];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 140;
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

- (BOOL)validate {
    return self.viewModel.validateVitaminProperties;
}

- (NSString *)vitaminName {
    return self.viewModel.vitaminName;
}

- (void)onLeftBarButtonClicked {
    [self.delegate onVitaminPropertiesCancelClicked];
}

- (IBAction)onNextClicked:(id)sender {
    BOOL isValid = [self validate];
    if (!isValid) {
        [self showAlert];
    } else {
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
    [self onNextClicked:textField];
    return YES;
}

@end
