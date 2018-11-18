//
//  VitaminStorageManager.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "StorageManagerDataSource.h"

@interface VitaminStorageManager : NSObject <StorageManagerDataSource>

- (NSFetchedResultsController *)loadVitaminsFetchedResultsController:(id <NSFetchedResultsControllerDelegate>)delegate
                                                           inContext:(NSManagedObjectContext *)context;

@end
