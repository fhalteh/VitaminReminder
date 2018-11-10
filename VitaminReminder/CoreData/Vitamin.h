//
//  Vitamin.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "Managed.h"

@class VitaminIntake, Dosage;

@interface Vitamin : NSManagedObject <Managed>

+ (NSFetchRequest<Vitamin *> *)fetchRequest;
+ (Vitamin *)addVitaminInContext:(NSManagedObjectContext *)context;
+ (NSFetchedResultsController *)fetchedResultsControllerWithDelegate:(id <NSFetchedResultsControllerDelegate>)delegate
                                                             context:(NSManagedObjectContext *)context;
+ (NSArray <Vitamin *> *)fetchVitaminsInManagedObjectContext:(NSManagedObjectContext *)context;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) NSArray <Dosage *> *dosage;
@property (nullable, nonatomic, copy) NSString *notes;
@property (nullable, nonatomic, retain) NSSet<VitaminIntake *> *vitaminIntakes;

@end
