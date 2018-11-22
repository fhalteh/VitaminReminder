//
//  VitaminListGenerator.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class StorageManager, VitaminIntakeCellModel;

@interface DailyVitaminsFactory : NSObject

+ (NSArray <VitaminIntakeCellModel *> *)createVitaminsListFromStorageManager:(StorageManager *)storageManager

                                                                 date:(NSDate *)date;

@end
