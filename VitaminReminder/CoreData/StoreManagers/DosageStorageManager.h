//
//  DosageStorageManager.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StorageManagerDataSource.h"
#import "DaysDataModel.h"

@class Dosage;

@interface DosageStorageManager : NSObject <StorageManagerDataSource>

//- (NSFetchedResultsController *)loadDosageFetchedResultsController:(id <NSFetchedResultsControllerDelegate>)delegate
//                                                     forDay:(Weekday)weekday
//                                                  inContext:(NSManagedObjectContext *)context;

- (NSArray <Dosage *> *)getDosagesForDay:(Weekday)weekday
                               inContext:(NSManagedObjectContext *)context;
//@property (nonatomic) NSManagedObjectContext *backgroundContext;

//- (instancetype)initWithContainer:(NSPersistentContainer *)container;
//
//- (Dosage *)addDosageWithDosageDataModel:(DosageDataModel *)dosageDataModel;
//- (void)remove:(NSManagedObjectID *)objectID;
//- (NSArray <Dosage *> *)fetchAll;
//- (void)save;


@end
