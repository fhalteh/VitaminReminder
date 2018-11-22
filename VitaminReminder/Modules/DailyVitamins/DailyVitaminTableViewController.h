//
//  DailyVitaminTableViewController.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmptyDataView.h"

@class StorageManager;

@interface DailyVitaminTableViewController : UITableViewController

@property (nonatomic, strong) NSDate *currentDate;
@property (nonatomic, strong) StorageManager *storageManager;

- (instancetype)initWithStorageManager:(StorageManager *)storageManager;

@end

