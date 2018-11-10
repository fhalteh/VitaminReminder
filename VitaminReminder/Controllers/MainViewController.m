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

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UIView *tableViewContainer;
@property VitaminIntakeTableVC *vitaminIntakeTableVC;
@property (weak, nonatomic) IBOutlet UIView *headerView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addVitaminIntakeTableVC];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.headerView addShadow];
}

- (void)addVitaminIntakeTableVC {
    self.vitaminIntakeTableVC = [[VitaminIntakeTableVC alloc] initWithDelegate:self
                                                                       context:self.managedObjectContext];;
    [self addChildViewController:self.vitaminIntakeTableVC
                 toContainerView:self.tableViewContainer];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

+ (NSString *)identifier {
    return @"MainViewController";
}

#pragma mark - Action buttons

- (IBAction)onEditVitaminsClicked:(id)sender {
    VitaminsViewController *viewController = [[VitaminsViewController alloc]
                                              initWithContext:self.managedObjectContext];
    [self presentViewController:viewController animated:true completion:nil];
}


@end
