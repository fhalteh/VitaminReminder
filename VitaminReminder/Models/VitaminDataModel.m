//
//  VitaminDataModel.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "VitaminDataModel.h"
#import "DaysDataModel.h"
#import "DosageDataModel.h"
#import "Vitamin.h"

@implementation VitaminDataModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.days = [DaysDataModel alloc];
        self.dosages = [NSMutableArray new];
    }
    return self;
}

- (instancetype)initWithVitamin:(Vitamin *)vitamin {
    self = [super init];
    if (self) {
        self.managedObjectId = vitamin.objectID;
        self.name = vitamin.name;
        self.days = [self daysDataModelFrom:vitamin.days];
        self.dosages = [self dosagesFrom:vitamin.dosages];
    }
    return self;
}

- (DaysDataModel *)daysDataModelFrom:(Days *)days {
    return [[DaysDataModel alloc] initWithDays:days];
}

- (NSMutableArray <DosageDataModel *> *)dosagesFrom:(NSSet<Dosage *> *)dosages {
    NSMutableArray *dosagesDataModel = [NSMutableArray new];
    for (Dosage *currentDosage in dosages) {
        [dosagesDataModel addObject:[[DosageDataModel alloc] initWithDosage:currentDosage]];
    }
    return dosagesDataModel;
}

- (ObjectDataModelType)getType {
    return ObjectDataModelTypeVitamin;
}

@end
