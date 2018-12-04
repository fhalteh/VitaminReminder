//
//  NSDate+Utils.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    DayChangeNext,
    DayChangePrevious,
} DayChange;

@interface NSDate (Utils)

- (NSDate *)dateByAddingOneDay;
- (NSDate *)dateByRemovingOneDay;
- (BOOL)isToday;
- (BOOL)isYesterday;
- (BOOL)isTomorrow;
+ (NSDate *)dateFromHours:(int)hours minutes:(int)minutes;
- (NSString *)inHoursAndMinutes;
- (NSDate *)startOfDay;
- (NSDate *)endOfDay;
- (NSString *)shortDateString;
- (NSString *)dateString;
- (NSInteger)weekdayNumber;
- (NSDate *)dateAfterDayChange:(DayChange)dayChange;
- (NSDate *)dateWithDayFromDate:(NSDate *)date;

@end
