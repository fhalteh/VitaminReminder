//
//  MainViewController.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "MainViewController.h"
#import "UIViewController+Utils.h"
#import "UIView+Utils.h"
#import "VitaminsViewController.h"
#import "NSDate+Utils.h"

// TODO: change name t ohome?
@interface MainViewController ()

@property (strong, nonatomic) NSDate *currentDate;
@property (weak, nonatomic) IBOutlet UIView *tableViewContainer;
@property (nonatomic, strong) VitaminIntakePagingViewController *pagingViewController;
@property (weak, nonatomic) IBOutlet CustomNavigationBar *headerView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.headerView.delegate = self;
    self.currentDate = [NSDate date];
    [self updateTitle];
    [self addVitaminIntakeTableVC];
    [self setupNavigationBar];
}

- (void)setupNavigationBar {
    [self.headerView setRightBarButtonType:NavigationButtonTypeRightArrow];
    [self.headerView setLeftBarButtonType:NavigationButtonTypeLeftArrow];
}

- (void)addVitaminIntakeTableVC {
    self.pagingViewController = [[VitaminIntakePagingViewController alloc] initWithDelegate:self];
    self.pagingViewController.storageManager = self.storageManager;
    [self addChildViewController:self.pagingViewController
                 toContainerView:self.tableViewContainer];
}

- (void)updateTitle {
    [self.headerView updateTitle:self.currentDate.dateString];
}

- (void)updateCurrentDateAndTitleWithDate:(NSDate *)date {
    self.currentDate = date;
    [self updateTitle];
}

#pragma mark - CustomNavigationBarDelegate

- (void)onLeftBarButtonClicked {
    [self updateCurrentDateAndTitleWithDate:self.currentDate.dateByRemovingOneDay];
    [self.pagingViewController updateViewControllerWithDayChange:DayChangePrevious];
}

- (void)onRightBarButtonClicked {
    [self updateCurrentDateAndTitleWithDate:self.currentDate.dateByAddingOneDay];
    [self.pagingViewController updateViewControllerWithDayChange:DayChangeNext];
}

#pragma mark - VitaminIntakePagingViewControllerDelegate

- (void)onCurrentDateUpdated:(NSDate *)date {
    [self updateCurrentDateAndTitleWithDate:date];
}

@end
