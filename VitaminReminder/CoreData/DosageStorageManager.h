//
//  DosageStorageManager.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DosageDataModel, Dosage;

@interface DosageStorageManager : NSObject

@property (nonatomic) NSManagedObjectContext *backgroundContext;

- (instancetype)initWithContainer:(NSPersistentContainer *)container;

- (Dosage *)addDosageWithDosageDataModel:(DosageDataModel *)dosageDataModel;
- (void)remove:(NSManagedObjectID *)objectID;
- (NSArray <Dosage *> *)fetchAll;
- (void)save;


@end
