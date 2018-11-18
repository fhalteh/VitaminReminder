//
//  DosageStorageManager.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "DosageStorageManager.h"
#import "Dosage.h"
#import "DosageDataModel.h"

@interface DosageStorageManager()

@property (nonatomic) NSPersistentContainer *persistentContainer;
//@property (nonatomic) NSManagedObjectContext *backgroundContext;

@end

@implementation DosageStorageManager

- (instancetype)initWithContainer:(NSPersistentContainer *)container {
    self = [super init];
    if (self) {
        self.persistentContainer = container;
    }
    return self;
}

- (NSManagedObjectContext *)backgroundContext {
    if (!_backgroundContext) {
        _backgroundContext = [self.persistentContainer newBackgroundContext];
    }
    return _backgroundContext;
}

- (Dosage *)addDosageWithDosageDataModel:(DosageDataModel *)dosageDataModel {
    Dosage *dosage = [NSEntityDescription insertNewObjectForEntityForName:Dosage.entityName
                                                   inManagedObjectContext:self.backgroundContext];
    dosage.numberOfPills = dosageDataModel.numberOfPills;
    dosage.time = dosageDataModel.time;
    return dosage;
}

- (void)remove:(NSManagedObjectID *)objectID {
    NSManagedObject *object = [self.backgroundContext objectWithID:objectID];
    [self.backgroundContext deleteObject:object];
}

- (NSArray <Dosage *> *)fetchAll {
    NSFetchRequest *fetchRequest = Dosage.fetchRequest;
    NSError *error;
    NSArray *results = [self.persistentContainer.viewContext executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"An error occurred while fetching all dosages.");
    }
    return results ? results : @[];
}

- (void)save {
    if ([self.backgroundContext hasChanges]) {
        NSError *error;
        [self.backgroundContext save:&error];
        if (error) {
            NSLog(@"An error occurred while fetching all dosages.");
        }
    }
}

@end
