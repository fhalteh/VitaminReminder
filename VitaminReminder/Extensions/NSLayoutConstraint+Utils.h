//
//  NSLayoutConstraint+Utils.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ConstraintDirectionHorizontal,
    ConstraintDirectionVertical
} ConstraintDirection;

@interface NSLayoutConstraint (Utils)

+ (NSArray <NSLayoutConstraint *> *)createConstraintsWithDirection:(ConstraintDirection)direction childView:(UIView *)view;

@end
