//
//  MockPersistentContainer.m
//  VitaminReminderTests
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "MockPersistentContainer.h"

@implementation MockPersistentContainerFactory

+ (NSPersistentContainer *)createVitaminContainer {
    NSPersistentContainer *container = [[NSPersistentContainer alloc] initWithName:@"VitaminReminder"];
    [container loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
        if (error != nil) {
            NSLog(@"Unresolved error %@, %@", error, error.userInfo);
            abort();
        }
    }];
    return container;
}

@end
