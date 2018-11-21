//
//  UIAlertController+Utils.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-20.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "UIAlertController+Utils.h"

@implementation UIAlertController (Utils)

+ (void)showAlertInViewController:(UIViewController *)viewController
                            title:(NSString *)title
                          message:(NSString *)message
                           button:(NSString *)buttonTitle {
    UIAlertController *alert = [UIAlertController
                                 alertControllerWithTitle:title
                                 message:message
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *button = [UIAlertAction
                             actionWithTitle:buttonTitle
                             style:UIAlertActionStyleDefault
                             handler:nil];
    [alert addAction:button];
    [viewController presentViewController:alert animated:YES completion:nil];
}

@end
