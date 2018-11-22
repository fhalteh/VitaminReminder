//
//  StorageManager.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "StorageManager.h"
#import "DosageStorageManager.h"
#import "VitaminStorageManager.h"
#import "DaysStorageManager.h"
#import "UserVitaminIntakeStorageManager.h"
#import "Vitamin.h"
#import "VitaminDataModel.h"
#import "UserVitaminIntakeDataModel.h"
#import "Dosage.h"
#import "UserVitaminIntake.h"

@interface StorageManager()

@property (nonatomic) NSPersistentContainer *persistentContainer;
@property (nonatomic) DosageStorageManager *dosageStorageManager;
@property (nonatomic) VitaminStorageManager *vitaminStorageManager;
@property (nonatomic) DaysStorageManager *daysStorageManager;
@property (nonatomic) UserVitaminIntakeStorageManager *userVitaminIntakeStorageManager;

@end

@implementation StorageManager

- (instancetype)initWithContainer:(NSPersistentContainer *)container {
    self = [super init];
    if (self) {
        self.persistentContainer = container;
    }
    return self;
}

- (NSFetchedResultsController *)loadVitaminsFetchedResultsController:(id <NSFetchedResultsControllerDelegate>)delegate {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    return [self.vitaminStorageManager loadVitaminsFetchedResultsController:delegate
                                                                  inContext:context];
}

- (NSArray <Dosage *> *)getDosagesForDay:(Weekday)weekday {
    return [self.dosageStorageManager getDosagesForDay:weekday
                                             inContext:self.persistentContainer.viewContext];
}

- (NSArray *)getIntakesForDate:(NSDate *)date {
    return [self.userVitaminIntakeStorageManager getIntakesForDate:date
                                                         inContext:self.persistentContainer.viewContext];
}

- (void)addVitaminDataModel:(VitaminDataModel *)vitaminDataModel {
    [self.backgroundContext performBlock:^{
        // Remove previous vitamin if it exists
        if (vitaminDataModel.managedObjectId) {
            [self remove:vitaminDataModel.managedObjectId];
        }
        [self.vitaminStorageManager addDataModel:vitaminDataModel
                                       inContext:self.backgroundContext];
        [self save];
    }];
}

- (void)addUserVitaminIntake:(UserVitaminIntakeDataModel *)userVitaminIntakeDataModel
              dosageObjectID:(NSManagedObjectID *)dosageObjectID {
    // Check the dosage, update ti
    [self.backgroundContext performBlock:^{
        // Remove previous vitamin if it exists
        Dosage *dosage = [self.backgroundContext objectWithID:dosageObjectID];
        // Add a new user vitamin intake
        UserVitaminIntake *userVitaminIntake = (UserVitaminIntake *)[self.userVitaminIntakeStorageManager addDataModel:userVitaminIntakeDataModel inContext:self.backgroundContext];
        [dosage addIntakesObject:userVitaminIntake];
        [self save];
    }];
}

- (void)removeUserVitaminIntake:(UserVitaminIntakeDataModel *)userVitaminIntakeDataModel dosageObjectID:(NSManagedObjectID *)dosageObjectID {
    [self.backgroundContext performBlock:^{
        UserVitaminIntake *userVitaminIntake = [self.userVitaminIntakeStorageManager getIntakeWithUserVitaminIntakeDataModel:userVitaminIntakeDataModel dosageObjectID:dosageObjectID inContext:self.backgroundContext];
        if (userVitaminIntake) {
            [self.backgroundContext deleteObject:(NSManagedObject *)userVitaminIntake];
        }
        [self save];
    }];
}

- (NSManagedObjectContext *)backgroundContext {
    if (!_backgroundContext) {
        _persistentContainer.viewContext.automaticallyMergesChangesFromParent = YES;
        _backgroundContext = [self.persistentContainer newBackgroundContext];
    }
    return _backgroundContext;
}

- (void)remove:(NSManagedObjectID *)objectID {
    [self.backgroundContext performBlock:^{
        NSManagedObject *object = [self.backgroundContext objectWithID:objectID];
        [self.backgroundContext deleteObject:object];
        [self save];
    }];
}

- (void)save {
    if ([self.backgroundContext hasChanges]) {
        NSError *error;
        [self.backgroundContext save:&error];
        if (error) {
            NSLog(@"An error occurred while saving. %@", error);
        }
    }
}

#pragma mark - lazy initializers

- (DosageStorageManager *)dosageStorageManager {
    if (!_dosageStorageManager) {
        _dosageStorageManager = [DosageStorageManager new];
    }
    return _dosageStorageManager;
}

- (VitaminStorageManager *)vitaminStorageManager {
    if (!_vitaminStorageManager) {
        _vitaminStorageManager = [VitaminStorageManager new];
    }
    return _vitaminStorageManager;
}

- (DaysStorageManager *)daysStorageManager {
    if (!_daysStorageManager) {
        _daysStorageManager = [DaysStorageManager new];
    }
    return _daysStorageManager;
}

- (UserVitaminIntakeStorageManager *)userVitaminIntakeStorageManager {
    if (!_userVitaminIntakeStorageManager) {
        _userVitaminIntakeStorageManager = [UserVitaminIntakeStorageManager new];
    }
    return _userVitaminIntakeStorageManager;
}


@end
