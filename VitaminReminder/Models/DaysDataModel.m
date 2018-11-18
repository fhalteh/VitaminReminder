//
//  DaysDataModel.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "DaysDataModel.h"

@implementation DaysDataModel

+ (DaysDataModel *)daysDataModelWithDays:(NSArray *)days {
    DaysDataModel *dataModal = [[DaysDataModel alloc] init];
    dataModal.monday = [days containsObject:@(WeekdayMonday)];
    dataModal.tuesday = [days containsObject:@(WeekdayTuesday)];
    dataModal.wednesday = [days containsObject:@(WeekdayWednesday)];
    dataModal.thursday = [days containsObject:@(WeekdayThursday)];
    dataModal.friday = [days containsObject:@(WeekdayFriday)];
    dataModal.saturday = [days containsObject:@(WeekdaySaturday)];
    dataModal.sunday = [days containsObject:@(WeekdaySunday)];
    return dataModal;
}

- (ObjectDataModelType)getType {
    return ObjectDataModelTypeDays;
}

@end
