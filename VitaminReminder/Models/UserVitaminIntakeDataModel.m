//
//  UserVitaminIntakeDataModel.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "UserVitaminIntakeDataModel.h"

@implementation UserVitaminIntakeDataModel

+ (UserVitaminIntakeDataModel *)dataModelWithIntakeDate:(NSDate *)date {
    UserVitaminIntakeDataModel *dataModel = [[UserVitaminIntakeDataModel alloc] init];
    dataModel.intakeDate = date;
    return dataModel;
}

- (ObjectDataModelType)getType {
    return ObjectDataModelTypeUserVitaminIntake;
}

@end
