//
//  DaysTests.m
//  VitaminReminderTests
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <CoreData/CoreData.h>
#import "PersistentContainerFactory.h"
#import "Days.h"
#import "MockPersistentContainer.h"
#import "DaysDataModel.h"
#import "DaysStorageManager.h"
#import "StorageManager.h"

@interface DaysTests : XCTestCase

@property NSPersistentContainer *persistentContainer;
@property DaysStorageManager *daysStorageManager;
@property StorageManager *storageManager;

@end

@implementation DaysTests

- (void)setUp {
    self.persistentContainer = [MockPersistentContainerFactory createVitaminContainer];
    self.storageManager = [[StorageManager alloc] initWithContainer:self.persistentContainer];
    self.daysStorageManager = [DaysStorageManager new];
}

- (void)testAddingDays {
//    NSArray *days = @[@(WeekdayMonday), @(WeekdayThursday)];
    [self insertDaysDataModelWithDays:@[]];
    [self.storageManager save];
    NSArray *allObjects = [self.daysStorageManager fetchAllInContext:self.persistentContainer.viewContext];
    XCTAssertNotNil(allObjects);
    XCTAssertEqual(allObjects.count, 1);
}

- (void)testDefaultDaysFalse {
    [self insertDaysDataModelWithDays:@[]];
    NSArray *allObjects = [self.daysStorageManager fetchAllInContext:self.persistentContainer.viewContext];
    Days *days = allObjects.firstObject;
    XCTAssertFalse(days.monday);
    XCTAssertFalse(days.tuesday);
    XCTAssertFalse(days.wednesday);
    XCTAssertFalse(days.thursday);
    XCTAssertFalse(days.friday);
    XCTAssertFalse(days.saturday);
    XCTAssertFalse(days.sunday);
}

- (void)testAddingCorrectDays {
    NSArray *weekdays = @[@(WeekdayFriday), @(WeekdayTuesday)];
    [self insertDaysDataModelWithDays:weekdays];
    [self.storageManager save];
    NSArray *allObjects = [self.daysStorageManager fetchAllInContext:self.persistentContainer.viewContext];
    Days *days = allObjects.firstObject;
    [self assertCorrectDaysWithWeekDays:weekdays days:days];
}

- (void)testAddingCorrectDays2 {
    NSArray *weekdays = @[@(WeekdayMonday), @(WeekdaySaturday), @(WeekdayWednesday)];
    [self insertDaysDataModelWithDays:weekdays];
    [self.storageManager save];
    NSArray *allObjects = [self.daysStorageManager fetchAllInContext:self.persistentContainer.viewContext];
    Days *days = allObjects.firstObject;
    [self assertCorrectDaysWithWeekDays:weekdays days:days];
}

- (void)assertCorrectDaysWithWeekDays:(NSArray *)weekdays days:(Days *)days {
    XCTAssertEqual(@(days.monday).boolValue, [weekdays containsObject:@(WeekdayMonday)]);
    XCTAssertEqual(days.tuesday, [weekdays containsObject:@(WeekdayTuesday)]);
    XCTAssertEqual(days.wednesday, [weekdays containsObject:@(WeekdayWednesday)]);
    XCTAssertEqual(days.thursday, [weekdays containsObject:@(WeekdayThursday)]);
    XCTAssertEqual(days.friday, [weekdays containsObject:@(WeekdayFriday)]);
    XCTAssertEqual(days.saturday, [weekdays containsObject:@(WeekdaySaturday)]);
    XCTAssertEqual(days.sunday, [weekdays containsObject:@(WeekdaySunday)]);
}

- (Days *)insertDaysDataModelWithDays:(NSArray *)days {
    DaysDataModel *dataModel = [DaysDataModel daysDataModelWithDays:days];
    return (Days *)[self.daysStorageManager addDataModel:dataModel
                                               inContext:self.storageManager.backgroundContext];
}

- (void)tearDown {
    [super tearDown];
    [self flushData];
}

- (void)flushData {
    NSError *error;
    NSArray *fetchedDays = [self.persistentContainer.viewContext executeFetchRequest:Days.fetchRequest error:&error];
    for (Days *days in fetchedDays) {
        [self.persistentContainer.viewContext deleteObject:days];
    }
    [self.persistentContainer.viewContext save:&error];
}


- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
