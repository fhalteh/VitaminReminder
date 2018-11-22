//
//  WelcomeViewController.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WelcomeViewControllerDelegate

- (void)onWelcomeViewControllerNextButtonClicked;

@end

@interface WelcomeViewController : UIViewController

- (instancetype)initWithDelegate:(id <WelcomeViewControllerDelegate>)delegate;

@end
