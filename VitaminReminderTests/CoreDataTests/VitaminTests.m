//
//  VitaminTests.m
//  VitaminReminderTests
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Vitamin.h"
#import "VitaminDataModel.h"
#import "VitaminStorageManager.h"
#import "StorageManager.h"
#import "MockPersistentContainer.h"
#import "Color.h"
#import "DaysDataModel.h"
#import "DosageDataModel.h"

@interface VitaminTests : XCTestCase

@property NSPersistentContainer *persistentContainer;
@property VitaminStorageManager *vitaminStorageManager;
@property StorageManager *storageManager;

@end

@implementation VitaminTests

- (void)setUp {
    self.persistentContainer = [MockPersistentContainerFactory createVitaminContainer];
    self.storageManager = [[StorageManager alloc] initWithContainer:self.persistentContainer];
    self.vitaminStorageManager = [VitaminStorageManager new];
}

- (void)testAddingVitamin {
    NSString *name = @"Vitamin B 12";
    NSString *notes = @"NOTES!@#";
    AppearanceColor color = AppearanceColorGreen;
    NSMutableArray *dosages = [NSMutableArray new];
    for (int i = 0; i < 5; i++) {
        DosageDataModel *dosageDataModel = [self createDosageWithNumberOfPills:22 time:NSDate.date];
        [dosages addObject:dosageDataModel];
    }
    DaysDataModel *daysDataModel = [self createDaysDataModel:@[@(WeekdayMonday), @(WeekdayThursday)]];
    [self insertVitaminWithName:name
                          notes:notes
                          color:color
                           days:daysDataModel
                        dosages:dosages];
    [self.storageManager save];
    NSArray *allVitamins = [self.vitaminStorageManager fetchAllInContext:self.persistentContainer.viewContext];
    XCTAssertNotNil(allVitamins);
    XCTAssertEqual(allVitamins.count, 1);
}

- (void)testAddingCorrectVitaminDetails {
    NSString *name = @"Vitamin B 12";
    NSString *notes = @"NOTES!@#";
    AppearanceColor color = AppearanceColorGreen;
    NSMutableArray *dosages = [NSMutableArray new];
    for (int i = 0; i < 5; i++) {
        DosageDataModel *dosageDataModel = [self createDosageWithNumberOfPills:22 time:NSDate.date];
        [dosages addObject:dosageDataModel];
    }
    DaysDataModel *daysDataModel = [self createDaysDataModel:@[@(WeekdayMonday), @(WeekdayThursday)]];
    [self insertVitaminWithName:name
                          notes:notes
                          color:color
                           days:daysDataModel
                        dosages:dosages];
    [self.storageManager save];
    NSArray *allVitamins = [self.vitaminStorageManager fetchAllInContext:self.persistentContainer.viewContext];
    XCTAssertNotNil(allVitamins);
    XCTAssertEqual(allVitamins.count, 1);
    Vitamin *vitamin = allVitamins.firstObject;
    XCTAssertNotNil(vitamin);
    XCTAssertTrue([vitamin.name isEqualToString:name]);
    XCTAssertTrue([vitamin.notes isEqualToString:notes]);
    XCTAssertEqual(vitamin.color.intValue, color);
    XCTAssertEqual(vitamin.dosages.count, dosages.count);
}

- (void)testFetchAllVitamins {
    [self insertVitaminToDatabase];
    [self insertVitaminToDatabase];
    [self insertVitaminToDatabase];
    [self insertVitaminToDatabase];
    [self insertVitaminToDatabase];
    [self insertVitaminToDatabase];
    [self.storageManager save];
    NSArray *allObjects = [self.vitaminStorageManager fetchAllInContext:self.persistentContainer.viewContext];
    XCTAssertNotNil(allObjects);
    XCTAssertEqual(allObjects.count, 6);
}

- (void)testRemoveVitamin {
    [self insertVitaminToDatabase];
    [self insertVitaminToDatabase];
    [self insertVitaminToDatabase];
    [self insertVitaminToDatabase];
    [self insertVitaminToDatabase];
    [self insertVitaminToDatabase];
    [self.storageManager save];
    NSArray *allObjects = [self.vitaminStorageManager fetchAllInContext:self.persistentContainer.viewContext];
    int numberOfAllObjectsBeforeDeletion = (int)allObjects.count;
    Vitamin *vitamin = allObjects.firstObject;
    [self.storageManager remove:vitamin.objectID];
    [self.storageManager save];
    allObjects = [self.vitaminStorageManager fetchAllInContext:self.persistentContainer.viewContext];
    XCTAssertEqual(allObjects.count, numberOfAllObjectsBeforeDeletion - 1);
}

- (void)insertVitaminToDatabase {
    NSString *name = @"Vitamin B 12";
    NSString *notes = @"NOTES!@#";
    AppearanceColor color = AppearanceColorGreen;
    NSMutableArray *dosages = [NSMutableArray new];
    for (int i = 0; i < 5; i++) {
        DosageDataModel *dosageDataModel = [self createDosageWithNumberOfPills:22 time:NSDate.date];
        [dosages addObject:dosageDataModel];
    }
    DaysDataModel *daysDataModel = [self createDaysDataModel:@[@(WeekdayMonday), @(WeekdayThursday)]];
    [self insertVitaminWithName:name
                          notes:notes
                          color:color
                           days:daysDataModel
                        dosages:dosages];
}

- (Vitamin *)insertVitaminWithName:(NSString *)name
                             notes:(NSString *)notes
                             color:(AppearanceColor)color
                              days:(DaysDataModel *)days
                           dosages:(NSArray *)dosages {
    VitaminDataModel *dataModel = [VitaminDataModel new];
    dataModel.name = name;
    dataModel.notes = notes;
    dataModel.color = color;
    dataModel.days = days;
    dataModel.dosages = dosages;
    return (Vitamin *)[self.vitaminStorageManager addDataModel:dataModel
                      
                                                   inContext:self.storageManager.backgroundContext];
}

- (DosageDataModel *)createDosageWithNumberOfPills:(int)numberOfPills time:(NSDate *)time {
    return [DosageDataModel dataModelWithNumberOfPills:numberOfPills time:time];
}

- (DaysDataModel *)createDaysDataModel:(NSArray *)days {
    return [DaysDataModel daysDataModelWithDays:days];
}




- (void)tearDown {
    [super tearDown];
    [self flushData];
}

- (void)flushData {
    NSError *error;
    NSArray *vitamins = [self.persistentContainer.viewContext executeFetchRequest:Vitamin.fetchRequest error:&error];
    for (Vitamin *vitamin in vitamins) {
        [self.persistentContainer.viewContext deleteObject:vitamin];
    }
    [self.persistentContainer.viewContext save:&error];
}

@end