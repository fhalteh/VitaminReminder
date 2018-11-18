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
#import "ManagedObject.h"

@class UserVitaminIntake, Vitamin;

@interface Dosage: NSManagedObject <Managed>

+ (NSFetchRequest<Dosage *> *)fetchRequest;

//@property (nonatomic) int numberOfPills;
@property (nonatomic) int numberOfPills;
@property (nullable, nonatomic, copy) NSDate *time;
@property (nullable, nonatomic, retain) UserVitaminIntake *intakes;
@property (nullable, nonatomic, retain) Vitamin *vitamin;

@end
