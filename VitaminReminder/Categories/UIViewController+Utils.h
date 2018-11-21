//
//  UIViewController+Utils.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Utils)

- (void)addChildViewController:(UIViewController *)viewController
               toContainerView:(UIView *)containerView;

@end

