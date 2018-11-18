//
//  Vitamin.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//
//

#import <CoreData/CoreData.h>
#import "Managed.h"
#import "ManagedObject.h"

@class Days, Dosage;

@interface Vitamin: NSManagedObject <Managed>

+ (Vitamin *)addVitaminInContext:(NSManagedObjectContext *)context;
+ (NSFetchedResultsController *)fetchedResultsControllerWithDelegate:(id <NSFetchedResultsControllerDelegate>)delegate
                                                             context:(NSManagedObjectContext *)context;
+ (NSArray <Vitamin *> *)fetchVitaminsInManagedObjectContext:(NSManagedObjectContext *)context;

+ (NSFetchRequest<Vitamin *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *notes;
@property (nonatomic, copy) NSNumber *color;
@property (nullable, nonatomic, retain) Days *days;
@property (nullable, nonatomic, retain) NSSet<Dosage *> *dosages;

@end

@interface Vitamin (CoreDataGeneratedAccessors)

- (void)addDosagesObject:(Dosage *)value;
- (void)removeDosagesObject:(Dosage *)value;
- (void)addDosages:(NSSet<Dosage *> *)values;
- (void)removeDosages:(NSSet<Dosage *> *)values;

@end

