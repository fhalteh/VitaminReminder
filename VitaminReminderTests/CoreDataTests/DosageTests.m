//
//  DosageTests.m
//  VitaminReminderTests
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <CoreData/CoreData.h>
#import "CoreDataStack.h"
#import "Dosage.h"
#import "MockPersistentContainer.h"
#import "DosageDataModel.h"
#import "DosageStorageManager.h"
#import "StorageManager.h"

@interface DosageTests : XCTestCase

@property NSPersistentContainer *persistentContainer;
@property DosageStorageManager *dosageStorageManager;
@property StorageManager *storageManager;


@end

@implementation DosageTests

- (void)setUp {
    self.persistentContainer = [MockPersistentContainerFactory createVitaminContainer];
    self.storageManager = [[StorageManager alloc] initWithContainer:self.persistentContainer];
    self.dosageStorageManager = [DosageStorageManager new];
}

- (void)testAddingDosageDetails {
    int numberOfPills = 22;
    NSDate *time = [NSDate dateWithTimeIntervalSince1970:10];
    Dosage *dosage = [self insertDosageWithNumberOfPills:numberOfPills time:time];
    [self.storageManager save];
    NSArray *dosages = [self.dosageStorageManager fetchAllInContext:self.persistentContainer.viewContext];
    dosage = dosages.firstObject;
    XCTAssertNotNil(dosage);
    XCTAssertNotNil(dosage.managedObjectContext);
    XCTAssertEqual(dosage.numberOfPills, numberOfPills);
    XCTAssertEqual(dosage.time.timeIntervalSinceNow, time.timeIntervalSinceNow);
}

- (void)testFetchAllDosages {
    [self insertDosageWithNumberOfPills:12 time:NSDate.date];
    [self insertDosageWithNumberOfPills:22 time:NSDate.date];
    [self insertDosageWithNumberOfPills:55 time:NSDate.date];
    [self insertDosageWithNumberOfPills:100 time:NSDate.date];
    [self.storageManager save];
    NSArray *allObjects = [self.dosageStorageManager fetchAllInContext:self.persistentContainer.viewContext];
    XCTAssertNotNil(allObjects);
    XCTAssertEqual(allObjects.count, 4);
}

- (void)testRemoveDosage {
    [self insertDosageWithNumberOfPills:12 time:NSDate.date];
    [self insertDosageWithNumberOfPills:22 time:NSDate.date];
    [self insertDosageWithNumberOfPills:55 time:NSDate.date];
    [self.storageManager save];
    NSArray *allObjects = [self.dosageStorageManager fetchAllInContext:self.storageManager.backgroundContext];
    int numberOfAllObjectsBeforeDeletion = (int)allObjects.count;
    Dosage *dosage = allObjects.firstObject;
    [self.storageManager remove:dosage.objectID];
    [self.storageManager save];
    allObjects = [self.dosageStorageManager fetchAllInContext:self.persistentContainer.viewContext];
    XCTAssertEqual(allObjects.count, numberOfAllObjectsBeforeDeletion - 1);
}

- (Dosage *)insertDosageWithNumberOfPills:(int)numberOfPills time:(NSDate *)time {
    DosageDataModel *dataModel = [DosageDataModel dataModelWithNumberOfPills:numberOfPills time:time];
    return (Dosage *)[self.dosageStorageManager addDataModel:dataModel
                      
                                                   inContext:self.storageManager.backgroundContext];
}

- (void)tearDown {
    [super tearDown];
    [self flushData];
}

- (void)flushData {
    NSError *error;
    NSArray *dosages = [self.persistentContainer.viewContext executeFetchRequest:Dosage.fetchRequest error:&error];
    for (Dosage *dosage in dosages) {
        [self.persistentContainer.viewContext deleteObject:dosage];
    }
    [self.persistentContainer.viewContext save:&error];
}

@end
