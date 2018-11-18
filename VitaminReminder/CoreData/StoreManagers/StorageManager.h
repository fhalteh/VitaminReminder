//
//  StorageManager.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface StorageManager : NSObject

@property (nonatomic) NSManagedObjectContext *backgroundContext;

- (instancetype)initWithContainer:(NSPersistentContainer *)container;
- (NSFetchedResultsController *)loadVitaminsFetchedResultsController:(id <NSFetchedResultsControllerDelegate>)delegate;
- (void)remove:(NSManagedObjectID *)objectID;
- (void)save;

@end
