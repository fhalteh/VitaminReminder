//
//  VitaminIntake.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "Managed.h"

@class Vitamin;

@interface VitaminIntake : NSManagedObject <Managed>

+ (VitaminIntake *)addVitaminIntakeInContext:(NSManagedObjectContext *)context;
+ (NSFetchRequest<VitaminIntake *> *)fetchRequest;
+ (NSArray <VitaminIntake *> *)fetchVitaminIntakesOnDate:(NSDate *)date
                                  inManagedObjectContext:(NSManagedObjectContext *)context;

@property (nullable, nonatomic, copy) NSDate *intakeDate;
@property (nullable, nonatomic, retain) Vitamin *vitamin;

@end
