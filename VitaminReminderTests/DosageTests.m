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
//#import "DosageDataSource.h"
#import "Dosage.h"
#import "MockPersistentContainer.h"
#import "DosageDataModel.h"
#import "DosageStorageManager.h"

@interface DosageTests : XCTestCase

@property NSPersistentContainer *persistentContainer;
@property NSManagedObjectContext *context;
//@property DosageDataSource *dataSource; // TODO: could delete
@property DosageStorageManager *storageManager;

@end

@implementation DosageTests

- (void)setUp {
    self.persistentContainer = [MockPersistentContainerFactory createVitaminContainer];
    self.context = self.persistentContainer.newBackgroundContext;
//    self.dataSource = [DosageDataSource new];
    self.storageManager = [[DosageStorageManager alloc] initWithContainer:self.persistentContainer];
}

//- (void)

//- (void)testAddingDosage {
//    [self.dataSource addInContext:self.context];
//    NSArray <Dosage *> *allDosages = [self.dataSource getAllInContext:self.context];
//    XCTAssertNotNil(allDosages);
//    XCTAssertEqual(allDosages.count, 1);
//}

- (void)testAddingDosageDetails {
    int numberOfPills = 22;
    NSDate *time = [NSDate dateWithTimeIntervalSince1970:10];
    Dosage *dosage = [self insertDosageWithNumberOfPills:numberOfPills time:time];
    [self.storageManager save];
    XCTAssertNotNil(dosage);
    XCTAssertNotNil(dosage.managedObjectContext);
    XCTAssertEqual(dosage.numberOfPills, numberOfPills);
    XCTAssertEqual(dosage.time, time);
}

- (void)testFetchAllDosages {
    [self insertDosageWithNumberOfPills:12 time:NSDate.date];
    [self insertDosageWithNumberOfPills:22 time:NSDate.date];
    [self insertDosageWithNumberOfPills:55 time:NSDate.date];
    [self insertDosageWithNumberOfPills:100 time:NSDate.date];
    [self.storageManager save];
    NSArray *allObjects = [self.storageManager fetchAll];
    XCTAssertNotNil(allObjects);
    XCTAssertEqual(allObjects.count, 4);
}

- (void)testRemoveDosage {
    [self insertDosageWithNumberOfPills:12 time:NSDate.date];
    [self insertDosageWithNumberOfPills:22 time:NSDate.date];
    [self insertDosageWithNumberOfPills:55 time:NSDate.date];
    [self.storageManager save];
    NSArray *allObjects = [self.storageManager fetchAll];
    int numberOfAllObjectsBeforeDeletion = (int)allObjects.count;
    Dosage *dosage = allObjects.firstObject;
    [self.storageManager remove:dosage.objectID];
    [self.storageManager save];
    allObjects = [self.storageManager fetchAll];
    XCTAssertEqual(allObjects.count, numberOfAllObjectsBeforeDeletion - 1);
}

- (Dosage *)insertDosageWithNumberOfPills:(int)numberOfPills time:(NSDate *)time {
    Dosage *dosage = [NSEntityDescription insertNewObjectForEntityForName:Dosage.entityName
                                                   inManagedObjectContext:self.storageManager.backgroundContext];
    dosage.numberOfPills = numberOfPills;
    dosage.time = time;
    return dosage;
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
