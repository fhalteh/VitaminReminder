//
//  DosageDataSource.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ManagedObjectDataSource.h"

@class Dosage;

@interface DosageDataSource : NSObject <ManagedObjectDataSource>

//- (NSArray <Dosage *> *)getAll;
//- (void)addDosage:(Dosage *)dosage inContext:(NSManagedObjectContext *)context;

@end
