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

- (BOOL)isEverydaySelected {
    if (!self.sunday) {
        return false;
    }
    if (!self.monday) {
        return false;
    }
    if (!self.tuesday) {
        return false;
    }
    if (!self.wednesday) {
        return false;
    }
    if (!self.thursday) {
        return false;
    }
    if (!self.friday) {
        return false;
    }
    if (!self.saturday) {
        return false;
    }
    return true;
}

- (NSString *)daysString {
    NSString *daysString = @"";
    if (self.sunday) {
        daysString = [daysString stringByAppendingString:@"Su"];
    }
    if (self.monday) {
        daysString = [daysString stringByAppendingString:@"Mo"];
    }
    if (self.tuesday) {
        daysString = [daysString stringByAppendingString:@"Tu"];
    }
    if (self.wednesday) {
        daysString = [daysString stringByAppendingString:@"We"];
    }
    if (self.thursday) {
        daysString = [daysString stringByAppendingString:@"Th"];
    }
    if (self.friday) {
        daysString = [daysString stringByAppendingString:@"Fr"];
    }
    if (self.saturday) {
        daysString = [daysString stringByAppendingString:@"Sa"];
    }
    return daysString;
}

- (ObjectDataModelType)getType {
    return ObjectDataModelTypeDays;
}

@end
