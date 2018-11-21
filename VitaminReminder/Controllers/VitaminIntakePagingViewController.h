//
//  VitaminIntakePagingViewController.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VitaminIntakeTableVC.h"
#import "NSDate+Utils.h"

@protocol VitaminIntakePagingViewControllerDelegate <NSObject>

- (void)onCurrentDateUpdated:(NSDate *)date;

@end

@class StorageManager;
// TODO: create a protocol so the creator of this paging view controller can can be accessed

@interface VitaminIntakePagingViewController : UIPageViewController <UIPageViewControllerDelegate, UIPageViewControllerDataSource, VitaminIntakeTableVCDelegate>

@property (nonatomic, strong) StorageManager *storageManager;

- (instancetype)initWithDelegate:(id <VitaminIntakePagingViewControllerDelegate>)delegate;
- (void)updateViewControllerWithDayChange:(DayChange)dayChange;

@end
