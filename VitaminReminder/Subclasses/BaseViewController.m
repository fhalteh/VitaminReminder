//
//  BaseViewController.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-20.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "BaseViewController.h"
#import "UIView+Utils.h"
#import "UIViewController+Utils.h"

@interface BaseViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)setContentViewController:(UIViewController *)contentViewController {
    [self addChildViewController:contentViewController toContainerView:contentViewController];
}

- (void)setupHeaderView {
    [self.headerView setDelegate:self];
    [self.headerView addShadow];
}

- (void)setTitleLabelText:(NSString *)titleLabelText {
    [self.headerView.titleLabel setText:titleLabelText];
}

- (void)setLeftBarButtonTitle:(NSString *)leftBarButtonTitle {
    [self.headerView setLeftBarTextButtonTitle:leftBarButtonTitle];
}

- (void)setRightBarButtonTitle:(NSString *)rightBarButtonTitle {
    [self.headerView setRightBarTextButtonTitle:rightBarButtonTitle];
}

- (void)setLeftButtonType:(NavigationButtonType)leftButtonType {
    [self.headerView setLeftBarButtonType:leftButtonType];
}

- (void)setRightButtonType:(NavigationButtonType)rightButtonType {
    [self.headerView setRightBarButtonType:rightButtonType];
}


#pragma mark - CustomNavigationBarDelegate

- (void)onLeftBarButtonClicked {
    NSLog(@"Should be implemented by classes subclassing this class.");
}

- (void)onRightBarButtonClicked {
    NSLog(@"Should be implemented by classes subclassing this class.");
}

@end
