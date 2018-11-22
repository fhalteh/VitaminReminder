//
//  StorageManager.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "DaysDataModel.h"

@class Dosage, UserVitaminIntake, VitaminDataModel, UserVitaminIntakeDataModel;

@interface StorageManager : NSObject

@property (nonatomic) NSManagedObjectContext *backgroundContext;

- (instancetype)initWithContainer:(NSPersistentContainer *)container;
- (NSFetchedResultsController *)loadVitaminsFetchedResultsController:(id <NSFetchedResultsControllerDelegate>)delegate;

- (void)addVitaminDataModel:(VitaminDataModel *)vitaminDataModel;
- (void)addUserVitaminIntake:(UserVitaminIntakeDataModel *)userVitaminIntakeDataModel
              dosageObjectID:(NSManagedObjectID *)dosageObjectID;
- (NSArray <Dosage *> *)getDosagesForDay:(Weekday)weekday;
- (NSArray <UserVitaminIntake *> *)getIntakesForDate:(NSDate *)date;
- (void)removeUserVitaminIntake:(UserVitaminIntakeDataModel *)userVitaminIntakeDataModel dosageObjectID:(NSManagedObjectID *)dosageObjectID;
- (void)remove:(NSManagedObjectID *)objectID;
- (void)save;

@end
