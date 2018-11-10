//
//  NSDate+Utils.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "NSDate+Utils.h"

@implementation NSDate (Utils)

+ (NSDate *)dateFromHours:(int)hours minutes:(int)minutes {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.timeZone = NSTimeZone.localTimeZone;
    NSDate *currentDate = [NSDate date];
    NSDateComponents *dateComponents = [currentDate getDateComponentsFromCalendar:calendar];
    [dateComponents setHour:hours];
    [dateComponents setMinute:minutes];
    [dateComponents setSecond:0];
    return [calendar dateFromComponents:dateComponents];
}

- (NSString *)inHoursAndMinutes {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    return [formatter stringFromDate:self];
}

- (NSDate *)startOfDay {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.timeZone = NSTimeZone.localTimeZone;
    NSDateComponents *dateComponents = [self getDateComponentsFromCalendar:calendar];
    [dateComponents setHour:0];
    [dateComponents setMinute:0];
    [dateComponents setSecond:0];
    return [calendar dateFromComponents:dateComponents];
}

- (NSDate *)endOfDay {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.timeZone = NSTimeZone.localTimeZone;
    NSDateComponents *dateComponents = [self getDateComponentsFromCalendar:calendar];
    [dateComponents setHour:23];
    [dateComponents setMinute:59];
    [dateComponents setSecond:59];
    return [calendar dateFromComponents:dateComponents];
}

- (NSDateComponents *)getDateComponentsFromCalendar:(NSCalendar *)calendar {
    return [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
}

@end
