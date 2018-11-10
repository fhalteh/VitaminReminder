//
//  NSLayoutConstraint+Utils.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "NSLayoutConstraint+Utils.h"

@implementation NSLayoutConstraint (Utils)

+ (NSArray <NSLayoutConstraint *> *)createConstraintsWithDirection:(ConstraintDirection)direction childView:(UIView *)view {
    NSString *visualFormat = direction == ConstraintDirectionHorizontal ? @"H:|[childView]|" : @"V:|[childView]|";
    return [NSLayoutConstraint constraintsWithVisualFormat:visualFormat
                                                   options:0
                                                   metrics:nil
                                                     views:@{@"childView": view}];
}

@end
