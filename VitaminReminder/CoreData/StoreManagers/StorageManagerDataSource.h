//
//  StorageManagerDataSource.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ObjectDataModel.h"

@protocol StorageManagerDataSource <NSObject>

- (NSManagedObject *)addDataModel:(id <ObjectDataModel>)dataModel
                        inContext:(NSManagedObjectContext *)context;
- (NSArray <id <ObjectDataModel>> *)fetchAllInContext:(NSManagedObjectContext *)context;

@end
