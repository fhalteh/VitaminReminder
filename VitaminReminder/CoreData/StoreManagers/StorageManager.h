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

@class Dosage, UserVitaminIntake, VitaminDataModel;

@interface StorageManager : NSObject

@property (nonatomic) NSManagedObjectContext *backgroundContext;

- (instancetype)initWithContainer:(NSPersistentContainer *)container;
- (NSFetchedResultsController *)loadVitaminsFetchedResultsController:(id <NSFetchedResultsControllerDelegate>)delegate;

// TODO: should bve used
- (void)addVitaminDataModel:(VitaminDataModel *)vitaminDataModel;
//- (void)

- (void)addUserVitaminIntake:(UserVitaminIntake *)userVitaminIntake
              dosageObjectID:(NSManagedObjectID *)dosageObjectID;
- (NSArray <Dosage *> *)getDosagesForDay:(Weekday)weekday;
- (NSArray <UserVitaminIntake *> *)getIntakesForDate:(NSDate *)date;
//- (NSFetchedResultsController *)loadDosageFetchedResultsController:(id <NSFetchedResultsControllerDelegate>)delegate
//                                                            forDay:(Weekday)weekday;
- (void)remove:(NSManagedObjectID *)objectID;
- (void)save;

@end
