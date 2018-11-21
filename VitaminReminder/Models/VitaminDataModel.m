//
//  VitaminDataModel.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "VitaminDataModel.h"
#import "DaysDataModel.h"

@implementation VitaminDataModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.days = [DaysDataModel alloc];
        self.dosages = [NSMutableArray new];
    }
    return self;
}

- (ObjectDataModelType)getType {
    return ObjectDataModelTypeVitamin;
}

@end
