//
//  UserVitaminIntakeStorageManager.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "UserVitaminIntakeStorageManager.h"
#import "UserVitaminIntake.h"
#import "USerVitaminIntakeDataModel.h"

@implementation UserVitaminIntakeStorageManager

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
