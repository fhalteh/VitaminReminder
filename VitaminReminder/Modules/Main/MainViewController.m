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
#import "NSDate+Utils.h"
#import "UIImage+Utils.h"

@interface MainViewController()

@property (strong, nonatomic) NSDate *currentDate;
@property (weak, nonatomic) IBOutlet UIView *tableViewContainer;
@property (nonatomic, strong) VitaminIntakePagingViewController *pagingViewController;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentDate = [NSDate date];
    [self addDailyVitaminTableViewController];
    [self setupNavigationBar];
}

- (void)setupNavigationBar {
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar addShadow];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:UIImage.backImage style:UIBarButtonItemStylePlain target:self action:@selector(onLeftBarButtonClicked)];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:UIImage.nextImage style:UIBarButtonItemStylePlain target:self action:@selector(onRightBarButtonClicked)];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    [self updateTitle];
}

- (void)addDailyVitaminTableViewController {
    self.pagingViewController = [[VitaminIntakePagingViewController alloc] initWithDelegate:self];
    self.pagingViewController.storageManager = self.storageManager;
    [self addChildViewController:self.pagingViewController
                 toContainerView:self.tableViewContainer];
}

- (void)updateTitle {
    self.title = self.currentDate.dateString;
}

- (void)updateCurrentDateAndTitleWithDate:(NSDate *)date {
    self.currentDate = date;
    [self updateTitle];
}

#pragma mark - Actions

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
