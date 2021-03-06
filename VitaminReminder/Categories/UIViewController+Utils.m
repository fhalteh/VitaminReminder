//
//  UIViewController+Utils.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "UIViewController+Utils.h"
#import "NSLayoutConstraint+Utils.h"

@implementation UIViewController (Utils)

// Container view must be defined and added to the view


/**
 Adds a view controller to a container view as a child view controller.
 Note that the container view must be defined and added to the view

 @param viewController view controller that will be added
 @param containerView container view
 */
- (void)addChildViewController:(UIViewController *)viewController
               toContainerView:(UIView *)containerView {
    [self addChildViewController:viewController];
    [containerView addSubview:viewController.view];
    [viewController didMoveToParentViewController:self];
    UIView *childView = viewController.view;
    NSArray *horzConstraints = [NSLayoutConstraint createConstraintsWithDirection:ConstraintDirectionHorizontal childView:childView];
    NSArray *vertConstraints = [NSLayoutConstraint createConstraintsWithDirection:ConstraintDirectionVertical childView:childView];
    [self.view addConstraints:horzConstraints];
    [self.view addConstraints:vertConstraints];
    viewController.view.translatesAutoresizingMaskIntoConstraints = NO;
}

@end
