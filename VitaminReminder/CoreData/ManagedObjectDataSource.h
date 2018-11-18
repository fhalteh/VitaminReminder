//
//  ManagedObjectDataSource.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ManagedObject.h"
#import "Managed.h"

@protocol ManagedObjectDataSource

- (NSArray <__kindof id <Managed>> *)getAllInContext:(NSManagedObjectContext *)context;
//- (id <Managed>)add:(id <Managed>)object inContext:(NSManagedObjectContext *)context;


- (__kindof id <Managed>)addInContext:(NSManagedObjectContext *)context;
//- (T: id <Managed>)test:(NSManagedObjectContext *)context;

@end
