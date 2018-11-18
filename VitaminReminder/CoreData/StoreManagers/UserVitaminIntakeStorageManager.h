//
//  UserVitaminIntakeStorageManager.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StorageManagerDataSource.h"

@class UserVitaminIntake;

@interface UserVitaminIntakeStorageManager : NSObject <StorageManagerDataSource>

- (NSArray <UserVitaminIntake *> *)getIntakesForDate:(NSDate *)date
                                           inContext:(NSManagedObjectContext *)context;

@end
