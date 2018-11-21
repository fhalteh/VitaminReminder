//
//  BaseViewController.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-20.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomNavigationBar.h"

@interface BaseViewController : UIViewController <CustomNavigationBarDelegate>

@property (weak, nonatomic) IBOutlet CustomNavigationBar *headerView;
@property (nonatomic, strong) UIViewController *contentViewController;

@property (nonatomic, strong) NSString *titleLabelText;
@property (nonatomic, strong) NSString *leftBarButtonTitle;
@property (nonatomic, strong) NSString *rightBarButtonTitle;
@property (nonatomic) NavigationButtonType leftButtonType;
@property (nonatomic) NavigationButtonType rightButtonType;

@end
