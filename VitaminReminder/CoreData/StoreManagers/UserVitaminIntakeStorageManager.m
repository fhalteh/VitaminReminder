//
//  UserVitaminIntakeStorageManager.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "UserVitaminIntakeStorageManager.h"
#import "UserVitaminIntake.h"
#import "UserVitaminIntakeDataModel.h"
#import "Days.h"
#import "NSDate+Utils.h"

@implementation UserVitaminIntakeStorageManager

// TODO: should be utilized
- (NSArray <UserVitaminIntake *> *)getIntakesForDate:(NSDate *)date

                                           inContext:(NSManagedObjectContext *)context {
    NSFetchRequest *fetchRequest = UserVitaminIntake.fetchRequest;
    NSDate *startOfDay = date.startOfDay;
    NSDate *endOfDay = date.endOfDay;
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"intakeDate >= %@ && intakeDate <= %@", startOfDay, endOfDay];
    NSError *error;
    NSArray *results = [context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"An error occurred while fetching intakes for specific day.");
    }
    return results ? results : @[];
}

- (UserVitaminIntake *)getIntakeWithUserVitaminIntakeDataModel:(UserVitaminIntakeDataModel *)dataModel dosageObjectID:(NSManagedObjectID *)dosageObjectID inContext:(NSManagedObjectContext *)context {
    Dosage *dosage = [context objectWithID:dosageObjectID];
    NSFetchRequest *fetchRequest = UserVitaminIntake.fetchRequest;
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"intakeDate == %@ && dosage = %@", dataModel.intakeDate, dosage];
    NSError *error;
    NSArray *results = [context executeFetchRequest:fetchRequest error:&error];
    NSLog(@"Results: %@", results);
    if (error) {
        NSLog(@"An error occurred while fetching intakes for specific day.");
    }
    return results ? results.firstObject : nil;
}


- (NSArray<ObjectDataModel *> *)fetchAllInContext:(NSManagedObjectContext *)context {
    NSFetchRequest *fetchRequest = UserVitaminIntake.fetchRequest;
    NSError *error;
    NSArray *results = [context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"An error occurred while fetching all user vitamin intakes.");
    }
    return results ? results : @[];
}

- (NSManagedObject *)addDataModel:(ObjectDataModel *)dataModel
                        inContext:(NSManagedObjectContext *)context {
    ObjectDataModelType type = [dataModel getType];
    if (type != ObjectDataModelTypeUserVitaminIntake) {
        NSLog(@"An error ocurred. Wrong data model type.");
        return nil;
    }
    UserVitaminIntakeDataModel *userVitaminIntakeDataModel = (UserVitaminIntakeDataModel *)dataModel;
    UserVitaminIntake *userVitaminIntake = [NSEntityDescription insertNewObjectForEntityForName:UserVitaminIntake.entityName
                                                   inManagedObjectContext:context];
    userVitaminIntake.intakeDate = userVitaminIntakeDataModel.intakeDate;
    return userVitaminIntake;
}

@end
