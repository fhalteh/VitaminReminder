//
//  DosageDataModel.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "DosageDataModel.h"

@implementation DosageDataModel

+ (DosageDataModel *)dataModelWithNumberOfPills:(int)numberOfPills time:(NSDate *)time {
    DosageDataModel *dataModel = [DosageDataModel new];
    dataModel.time = time;
    dataModel.numberOfPills = numberOfPills;
    return dataModel;
}

- (ObjectDataModelType)getType {
    return ObjectDataModelTypeDosage;
}

@end
