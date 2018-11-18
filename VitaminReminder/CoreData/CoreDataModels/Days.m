//
//  Days.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//
//

#import "Days.h"
#import "NSDate+Utils.h"

@implementation Days

+ (NSFetchRequest<Days *> *)fetchRequest {
    return [NSFetchRequest fetchRequestWithEntityName:Days.entityName];
}

+ (NSString *)weekdayAttribute:(Weekday)weekday {
    switch (weekday) {
        case WeekdaySunday:
            return @"sunday";
        case WeekdayMonday:
            return @"monday";
        case WeekdayTuesday:
            return @"tuesday";
        case WeekdayWednesday:
            return @"wednesday";
        case WeekdayThursday:
            return @"thursday";
        case WeekdayFriday:
            return @"friday";
        case WeekdaySaturday:
            return @"saturday";
    }
    return @"";
}

+ (Weekday)weekdayFromDate:(NSDate *)date {
    NSInteger weekdayNumber = [date getWeekdayNumber];
    return (Weekday)weekdayNumber;
}

+ (NSString *)entityName {
    return @"Days";
}

@dynamic monday;
@dynamic tuesday;
@dynamic wednesday;
@dynamic thursday;
@dynamic friday;
@dynamic saturday;
@dynamic sunday;
@dynamic vitamin;

@end
