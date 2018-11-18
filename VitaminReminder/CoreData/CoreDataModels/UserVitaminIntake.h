//
//  UserVitaminIntake.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//
//

#import <CoreData/CoreData.h>
#import "Dosage.h"
#import "Managed.h"

@interface UserVitaminIntake: NSManagedObject <Managed>

+ (NSFetchRequest<UserVitaminIntake *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *intakeDate;
@property (nullable, nonatomic, retain) Dosage *dosage;

@end
