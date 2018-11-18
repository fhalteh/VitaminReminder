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
@property VitaminIntakeTableVC *vitaminIntakeTableVC;
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self.headerView addShadow];
}

- (void)addVitaminIntakeTableVC {
    self.vitaminIntakeTableVC = [[VitaminIntakeTableVC alloc] initWithDelegate:self
                                                                storageManager:self.storageManager];;
    [self addChildViewController:self.vitaminIntakeTableVC
                 toContainerView:self.tableViewContainer];
}

+ (NSString *)identifier {
    return @"MainViewController";
}

- (void)updateTitle {
    // Check if it's today or yesterday or
    [self.headerView updateTitle:self.currentDate.getDateString];
}

#pragma mark - Action buttons

- (IBAction)onEditVitaminsClicked:(id)sender {
    //TODO: remove me
//    VitaminsViewController *viewController = [[VitaminsViewController alloc]
//                                              initWithContext:self.managedObjectContext];
//    [self presentViewController:viewController animated:true completion:nil];
}

#pragma mark - CustomNavigationBarDelegate

- (void)onLeftBarButtonClicked {
    self.currentDate = self.currentDate.dateByRemovingOneDay;
    [self updateTitle];
    NSLog(@"on left bar button clicked");
}

- (void)onRightBarButtonClicked {
    self.currentDate = self.currentDate.dateByAddingOneDay;
    [self updateTitle];
    NSLog(@"on right bar button clicked");
}

@end
