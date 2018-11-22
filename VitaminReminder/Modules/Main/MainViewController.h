//
//  MainViewController.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DailyVitaminTableViewController.h"
#import "VitaminIntakePagingViewController.h"

@class StorageManager;

@interface MainViewController : UIViewController < VitaminIntakePagingViewControllerDelegate>

@property (nonatomic, strong) StorageManager *storageManager;

@end

