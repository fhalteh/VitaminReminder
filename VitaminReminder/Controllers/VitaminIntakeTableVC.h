//
//  VitaminIntakeTableVC.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmptyDataView.h"

@class StorageManager;

@protocol VitaminIntakeTableVCDelegate

@end

// TODO: rename
@interface VitaminIntakeTableVC : UITableViewController <EmptyDataViewDelegate>

@property (nonatomic, strong) NSDate *currentDate;
@property (nonatomic, strong) StorageManager *storageManager;

// Check if we need this?
-(instancetype)initWithDelegate:(id<VitaminIntakeTableVCDelegate>)delegate
                 storageManager:(StorageManager *)storageManager;

//- (instancetype)initWithDelegate:(id <VitaminIntakeTableVCDelegate>)delegate
//                         context:(NSManagedObjectContext *)context;

@end

