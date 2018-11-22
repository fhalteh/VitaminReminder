//
//  DailyVitaminsViewControllerTests.m
//  VitaminReminderTests
//
//  Created by Faris Halteh on 2018-11-22.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DailyVitaminTableViewController.h"
#import "MockPersistentContainer.h"
#import "StorageManager.h"
#import "VitaminDataModel.h"
#import "DosageDataModel.h"
#import "DaysDataModel.h"

@interface DailyVitaminsViewControllerTests : XCTestCase

@property NSPersistentContainer *persistentContainer;
@property (nonatomic, strong) DailyVitaminTableViewController *viewController;
@property (nonatomic, strong) StorageManager *storageManager;
@property (nonatomic, strong) VitaminDataModel *vitaminDataModel;
@property (nonatomic, strong) UIWindow *rootWindow;

@end

@implementation DailyVitaminsViewControllerTests

- (void)setUp {
    self.persistentContainer = [MockPersistentContainerFactory createVitaminContainer];
    self.storageManager = [[StorageManager alloc] initWithContainer:self.persistentContainer];
    self.rootWindow = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.rootWindow.hidden = NO;
    self.storageManager.backgroundContext = self.persistentContainer.viewContext;
    self.viewController = [[DailyVitaminTableViewController alloc] initWithStorageManager:self.storageManager];
    self.viewController.currentDate = [NSDate date];
    self.rootWindow.rootViewController = self.viewController;
    UIView *view = [self.viewController view];
    NSLog(@"%@", view);
    [self.viewController viewWillAppear:NO];
    [self.viewController viewDidAppear:NO];
}

- (void)addVitaminDataModel {
    VitaminDataModel *vitaminDataModel = [[VitaminDataModel alloc] init];
    vitaminDataModel.name = @"Vitamin Name";
    vitaminDataModel.dosages = [self createDosages];
    vitaminDataModel.days = [self createDaysDataModel];
    [self.storageManager addVitaminDataModel:vitaminDataModel];
    self.vitaminDataModel = vitaminDataModel;
}

- (DaysDataModel *)createDaysDataModel {
    DaysDataModel *daysDataModel = [[DaysDataModel alloc] init];
    NSArray *days = @[@(WeekdaySunday), @(WeekdayMonday), @(WeekdayTuesday), @(WeekdayWednesday), @(WeekdayThursday), @(WeekdayFriday), @(WeekdaySaturday)];
    daysDataModel.selectedDays = [NSMutableArray arrayWithArray:days];
    return daysDataModel;
}

- (NSMutableArray <DosageDataModel *> *)createDosages {
    NSMutableArray <DosageDataModel *> *dosages = [NSMutableArray new];
    DosageDataModel *dosageDataModel1 = [DosageDataModel new];
    dosageDataModel1.numberOfPills = 1;
    dosageDataModel1.time = [NSDate dateWithTimeIntervalSince1970:20];
    [dosages addObject:dosageDataModel1];
    
    DosageDataModel *dosageDataModel2 = [DosageDataModel new];
    dosageDataModel2.numberOfPills = 5;
    dosageDataModel2.time = [NSDate dateWithTimeIntervalSince1970:100];
    [dosages addObject:dosageDataModel2];
    return dosages;
}

- (void)testNumberOfSections {
    NSInteger sections = self.viewController.tableView.numberOfSections;
    XCTAssertEqual(sections, 1);
}

- (void)testLoadingCorrectResults {
    XCTestExpectation *expectation = [[XCTestExpectation alloc] initWithDescription:@"Test loading correct results."];
    dispatch_async(dispatch_get_main_queue(), ^{
        NSInteger rows = [self.viewController.tableView numberOfRowsInSection:0];
        XCTAssertEqual(rows, 2);
        [expectation fulfill];
    });

    [self waitForExpectations:@[expectation] timeout:10];
}

- (void)tearDown {
    [self.viewController viewWillDisappear:NO];
    [self.viewController viewDidDisappear:NO];
    self.rootWindow.rootViewController = nil;
    self.rootWindow.hidden = YES;
    self.rootWindow = nil;
}


@end
