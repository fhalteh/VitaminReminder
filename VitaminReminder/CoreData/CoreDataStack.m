//
//  CoreDataStack.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "CoreDataStack.h"

@implementation CoreDataStack

+ (void)createVitaminContainer:(void (^)(NSPersistentContainer *container))completionBlock {
    NSPersistentContainer *container = [[NSPersistentContainer alloc] initWithName:@"VitaminReminder"];
    [container loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
        if (error != nil) {
            NSLog(@"Unresolved error %@, %@", error, error.userInfo);
            abort();
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            completionBlock(container);
        });
    }];
}

@end
