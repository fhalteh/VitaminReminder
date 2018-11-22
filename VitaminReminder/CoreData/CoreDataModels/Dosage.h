//
//  Dosage.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//
//

#import <CoreData/CoreData.h>
#import "Managed.h"

@class UserVitaminIntake, Vitamin;

@interface Dosage: NSManagedObject <Managed>

+ (NSFetchRequest<Dosage *> *)fetchRequest;

@property (nonatomic) int numberOfPills;
@property (nullable, nonatomic, copy) NSDate *time;
@property (nullable, nonatomic, retain) NSSet<UserVitaminIntake *> *intakes;
@property (nullable, nonatomic, retain) Vitamin *vitamin;

@end

@interface Dosage (CoreDataGeneratedAccessors)

- (void)addIntakesObject:(UserVitaminIntake *)value;
- (void)removeIntakesObject:(UserVitaminIntake *)value;
- (void)addIntakes:(NSSet<UserVitaminIntake *> *)values;
- (void)removeIntakes:(NSSet<UserVitaminIntake *> *)values;

@end
