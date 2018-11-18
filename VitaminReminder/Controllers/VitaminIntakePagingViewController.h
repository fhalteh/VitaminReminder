//
//  VitaminIntakePagingViewController.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StorageManager;

@interface VitaminIntakePagingViewController : UIPageViewController <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property (nonatomic, strong) StorageManager *storageManager;

@end
