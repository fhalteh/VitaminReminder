//
//  VitaminReminderTests.m
//  VitaminReminderTests
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CoreDataStack.h"
#import "Vitamin.h"
#import "VitaminIntake.h"

@interface VitaminReminderTests : XCTestCase

@property NSPersistentContainer *persistentContainer;
@property NSManagedObjectContext *context;

@end

@implementation VitaminReminderTests

@synthesize context;

- (void)setUp {
    self.persistentContainer = [[NSPersistentContainer alloc] initWithName:@"VitaminReminder"];
    [self.persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
        if (error != nil) {
            NSLog(@"Unresolved error %@, %@", error, error.userInfo);
            abort();
        }
    }];
    self.context = self.persistentContainer.newBackgroundContext;
}

- (void)testAddingVitaminIntake {
    VitaminIntake *vitaminIntake = [NSEntityDescription insertNewObjectForEntityForName:VitaminIntake.entityName inManagedObjectContext:context];
    vitaminIntake.intakeDate = [NSDate date];
    NSArray *vitaminIntakes = [VitaminIntake fetchVitaminIntakesOnDate:NSDate.date inManagedObjectContext:context];
    XCTAssertNotNil(vitaminIntakes);
    XCTAssertEqual(vitaminIntakes.count, 1);
}

- (void)testAddingVitamin {
    Vitamin *vitamin = [NSEntityDescription insertNewObjectForEntityForName:Vitamin.entityName inManagedObjectContext:context];
    vitamin.name = @"Vitamin D";
    NSArray *vitamins = [Vitamin fetchVitaminsInManagedObjectContext:context];
    XCTAssertNotNil(vitamins);
    XCTAssertEqual(vitamins.count, 1);
}

@end
