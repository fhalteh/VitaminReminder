//
//  NSDate+Utils.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "NSDate+Utils.h"

static const unsigned componentFlags = (NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekOfMonth |  NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal);


// TODO: check if all methods are required?
@implementation NSDate (Utils)

- (NSDate *)dateByAddingOneDay {
    return [self dateByAddingDays:1];
}

- (NSDate *)dateByRemovingOneDay {
    return [self dateByAddingDays:-1];
}

- (NSDate *)dateByAddingDays:(NSInteger)days {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:days];
    NSCalendar *calendar = NSCalendar.currentCalendar;
    NSDate *newDate = [calendar dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

+ (NSDate *)dateYesterday {
    return [NSDate.date dateByRemovingOneDay];
}

+ (NSDate *)dateTomorrow {
    return [NSDate.date dateByAddingOneDay];
}

- (BOOL)isToday {
    return [self isEqualToDateIgnoringTime:[NSDate date]];
}

- (BOOL)isYesterday {
    return [self isEqualToDateIgnoringTime:[NSDate dateYesterday]];
}

- (BOOL)isTomorrow {
    return [self isEqualToDateIgnoringTime:[NSDate dateTomorrow]];
}

- (BOOL) isEqualToDateIgnoringTime: (NSDate *)date {
    NSDateComponents *components1 = [NSCalendar.currentCalendar components:componentFlags fromDate:self];
    NSDateComponents *components2 = [NSCalendar.currentCalendar components:componentFlags fromDate:date];
    return ((components1.year == components2.year) &&
            (components1.month == components2.month) &&
            (components1.day == components2.day));
}

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

- (NSString *)shortDateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM d"];
    return [dateFormatter stringFromDate:self];
}

- (NSString *)shortDateStringWithDay {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE, MMM d"];
    return [dateFormatter stringFromDate:self];
}

- (NSString *)stringWithDateStyle: (NSDateFormatterStyle) dateStyle timeStyle: (NSDateFormatterStyle) timeStyle {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateStyle = dateStyle;
    formatter.timeStyle = timeStyle;
    return [formatter stringFromDate:self];
}

- (NSString *)dateString {
    NSString *prefix = [self getPrefixDateString];
    if (prefix) {
        return [NSString stringWithFormat:@"%@, %@", prefix, self.shortDateString];
    }
    // Return the day and then
    
    return [self shortDateStringWithDay];
}

- (NSString *)getPrefixDateString {
    if (self.isToday) {
        return @"Today";
    } else if (self.isYesterday) {
        return @"Yesterday";
    } else if (self.isTomorrow) {
        return @"Tomorrow";
    }
    // TODO: return the day?
    
    return nil;
}

- (NSInteger)weekdayNumber {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:self];
    return [components weekday];
}

- (NSDate *)dateAfterDayChange:(DayChange)dayChange {
    if (dayChange == DayChangeNext) {
        return self.dateByAddingOneDay;
    }
    return self.dateByRemovingOneDay;
}

@end
