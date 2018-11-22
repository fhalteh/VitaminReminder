//
//  VitaminIntakePagingViewController.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DailyVitaminTableViewController.h"
#import "NSDate+Utils.h"

@protocol VitaminIntakePagingViewControllerDelegate <NSObject>

- (void)onCurrentDateUpdated:(NSDate *)date;

@end

@class StorageManager;

@interface VitaminIntakePagingViewController : UIPageViewController <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property (nonatomic, strong) StorageManager *storageManager;

- (instancetype)initWithDelegate:(id <VitaminIntakePagingViewControllerDelegate>)delegate;
- (void)updateViewControllerWithDayChange:(DayChange)dayChange;

@end
