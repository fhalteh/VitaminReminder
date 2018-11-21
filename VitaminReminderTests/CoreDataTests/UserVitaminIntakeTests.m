//
//  UserVitaminIntakeTests.m
//  VitaminReminderTests
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MockPersistentContainer.h"
#import "UserVitaminIntakeDataModel.h"
#import "UserVitaminIntakeStorageManager.h"
#import "StorageManager.h"
#import "UserVitaminIntake.h"
#import "NSDate+Utils.h"
#import "DosageDataModel.h"
#import "Dosage.h"
#import "DosageStorageManager.h"

@interface UserVitaminIntakeTests : XCTestCase

@property NSPersistentContainer *persistentContainer;
@property UserVitaminIntakeStorageManager *userVitaminIntakeStorageManager;
@property DosageStorageManager *dosageStorageManager;
@property StorageManager *storageManager;

@end

@implementation UserVitaminIntakeTests

- (void)setUp {
    self.persistentContainer = [MockPersistentContainerFactory createVitaminContainer];
    self.storageManager = [[StorageManager alloc] initWithContainer:self.persistentContainer];
    self.userVitaminIntakeStorageManager = [UserVitaminIntakeStorageManager new];
    self.dosageStorageManager = [DosageStorageManager new];
}

- (void)testAddingUserVitaminIntake {
    NSDate *expectedDate = [NSDate dateWithTimeIntervalSince1970:20];
    [self insertUserVitaminIntakeWithDate:expectedDate];
    [self.storageManager save];
    NSArray *userVitaminIntakes = [self.userVitaminIntakeStorageManager fetchAllInContext:self.persistentContainer.viewContext];
    UserVitaminIntake *userVitaminIntake = userVitaminIntakes.firstObject;
    XCTAssertNotNil(userVitaminIntake);
    XCTAssertNotNil(userVitaminIntake.managedObjectContext);
    XCTAssertNotNil(userVitaminIntake.intakeDate);
    XCTAssertEqual(userVitaminIntake.intakeDate.timeIntervalSince1970, expectedDate.timeIntervalSince1970);
}

- (void)testFetchAllUserVitaminIntakes {
    [self insertUserVitaminIntakeWithDate:NSDate.date];
    [self insertUserVitaminIntakeWithDate:NSDate.date];
    [self insertUserVitaminIntakeWithDate:NSDate.date];
    [self insertUserVitaminIntakeWithDate:NSDate.date];
    [self insertUserVitaminIntakeWithDate:NSDate.date];
    [self.storageManager save];
    NSArray *allObjects = [self.userVitaminIntakeStorageManager fetchAllInContext:self.persistentContainer.viewContext];
    XCTAssertNotNil(allObjects);
    XCTAssertEqual(allObjects.count, 5);
}

- (void)testFetchingIntakesToday {
    [self insertUserVitaminIntakeWithDate:NSDate.date];
    [self insertUserVitaminIntakeWithDate:NSDate.date];
    [self insertUserVitaminIntakeWithDate:NSDate.date];
    [self insertUserVitaminIntakeWithDate:NSDate.date];
    [self insertUserVitaminIntakeWithDate:NSDate.date];
    [self.storageManager save];
    NSArray *allObjects = [self.userVitaminIntakeStorageManager getIntakesForDate:NSDate.date inContext:self.persistentContainer.viewContext];
    XCTAssertNotNil(allObjects);
    XCTAssertEqual(allObjects.count, 5);
}

- (void)testFetchingAddedIntake {
    NSDate *date = NSDate.date;
    UserVitaminIntake *userVitaminIntake = [self insertUserVitaminIntakeWithDate:date];
    Dosage *dosage = [self insertDosageWithNumberOfPills:0 time:NSDate.date];
    userVitaminIntake.dosage = dosage;
    [self.storageManager save];
    
    UserVitaminIntakeDataModel *dataModel = [UserVitaminIntakeDataModel new];
    dataModel.intakeDate = date;
    
    userVitaminIntake = [self.userVitaminIntakeStorageManager getIntakeWithUserVitaminIntakeDataModel:dataModel dosageObjectID:dosage.objectID inContext:self.storageManager.backgroundContext];
    XCTAssertNotNil(userVitaminIntake);

    //    UserVitaminIntakeDataModel *dataModel = [UserVitaminIntakeDataModel new];
//    dataModel.intakeDate = date;
//    [self.storageManager save];
//    self.storageManager removeUserVitaminIntake:dataModel dosageObjectID:<#(NSManagedObjectID *)#>
}

- (Dosage *)insertDosageWithNumberOfPills:(int)numberOfPills time:(NSDate *)time {
    DosageDataModel *dataModel = [DosageDataModel dataModelWithNumberOfPills:numberOfPills time:time];
    return (Dosage *)[self.dosageStorageManager addDataModel:dataModel
                      
                                                   inContext:self.storageManager.backgroundContext];
}

- (void)testFetchingIntakesYesterday {
    NSDate *date = NSDate.date.dateByRemovingOneDay;
    [self insertUserVitaminIntakeWithDate:date];
    [self insertUserVitaminIntakeWithDate:date];
    [self insertUserVitaminIntakeWithDate:date];
    [self insertUserVitaminIntakeWithDate:date];
    [self insertUserVitaminIntakeWithDate:date.dateByAddingOneDay];
    [self.storageManager save];
    NSArray *allObjects = [self.userVitaminIntakeStorageManager getIntakesForDate:date inContext:self.persistentContainer.viewContext];
    XCTAssertNotNil(allObjects);
    XCTAssertEqual(allObjects.count, 4);
}

- (void)testRemoveUserVitaminIntake {
    [self insertUserVitaminIntakeWithDate:NSDate.date];
    [self insertUserVitaminIntakeWithDate:NSDate.date];
    [self insertUserVitaminIntakeWithDate:NSDate.date];
    [self.storageManager save];
    NSArray *allObjects = [self.userVitaminIntakeStorageManager fetchAllInContext:self.persistentContainer.viewContext];
    int numberOfAllObjectsBeforeDeletion = (int)allObjects.count;
    UserVitaminIntake *userVitaminIntake = allObjects.firstObject;
    [self.storageManager remove:userVitaminIntake.objectID];
    [self.storageManager save];
    allObjects = [self.userVitaminIntakeStorageManager fetchAllInContext:self.persistentContainer.viewContext];
    XCTAssertEqual(allObjects.count, numberOfAllObjectsBeforeDeletion - 1);
}

- (UserVitaminIntake *)insertUserVitaminIntakeWithDate:(NSDate *)date {
    UserVitaminIntakeDataModel *dataModel = [UserVitaminIntakeDataModel dataModelWithIntakeDate:date];
    return (UserVitaminIntake *)[self.userVitaminIntakeStorageManager addDataModel:dataModel inContext:self.storageManager.backgroundContext];
}

- (void)tearDown {
    [super tearDown];
    [self flushData];
}

- (void)flushData {
    NSError *error;
    NSArray *userVitaminIntakes = [self.persistentContainer.viewContext executeFetchRequest:UserVitaminIntake.fetchRequest error:&error];
    for (UserVitaminIntake *userVitaminIntake in userVitaminIntakes) {
        [self.persistentContainer.viewContext deleteObject:userVitaminIntake];
    }
    [self.persistentContainer.viewContext save:&error];
}


@end
