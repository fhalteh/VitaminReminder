//
//  UIAlertController+Utils.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-20.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIAlertController (Utils)

+ (void)showAlertInViewController:(UIViewController *)viewController
                            title:(NSString *)title
                          message:(NSString *)message
                           button:(NSString *)button;

@end
