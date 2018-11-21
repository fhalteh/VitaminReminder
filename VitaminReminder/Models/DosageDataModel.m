//
//  DosageDataModel.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "DosageDataModel.h"
#import "Dosage.h"

@implementation DosageDataModel

- (instancetype)initWithDosage:(Dosage *)dosage {
    self = [super init];
    if (self) {
        self.time = dosage.time;
        self.numberOfPills = dosage.numberOfPills;
    }
    return self;
}

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
