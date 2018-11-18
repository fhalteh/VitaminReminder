//
//  UserVitaminIntake.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//
//

#import "UserVitaminIntake.h"

@implementation UserVitaminIntake

+ (NSFetchRequest<UserVitaminIntake *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"UserVitaminIntake"];
}

+ (NSString *)entityName {
    return @"UserVitaminIntake";
}

@dynamic intakeDate;
@dynamic dosage;

@end
