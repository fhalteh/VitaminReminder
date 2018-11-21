//
//  DaysDataModel.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjectDataModel.h"
#import <CoreData/CoreData.h>

typedef enum : NSUInteger {
    WeekdaySunday = 1,
    WeekdayMonday,
    WeekdayTuesday,
    WeekdayWednesday,
    WeekdayThursday,
    WeekdayFriday,
    WeekdaySaturday,
} Weekday;

@class Days;

@interface DaysDataModel : ObjectDataModel

@property (nonatomic, strong) NSMutableArray <NSNumber *> *selectedDays;

@property (nonatomic, readonly) BOOL monday;
@property (nonatomic, readonly) BOOL tuesday;
@property (nonatomic, readonly) BOOL wednesday;
@property (nonatomic, readonly) BOOL thursday;
@property (nonatomic, readonly) BOOL friday;
@property (nonatomic, readonly) BOOL saturday;
@property (nonatomic, readonly) BOOL sunday;

- (instancetype)initWithDays:(Days *)days;
- (BOOL)noneSelected;
- (BOOL)isEverydaySelected;
- (NSString *)daysString;
- (BOOL)isWeekdaySelected:(Weekday)weekday;
+ (NSString *)getTitle:(Weekday)weekday;
- (void)updateWeekday:(Weekday)weekday selected:(BOOL)selected;
+ (DaysDataModel *)daysDataModelWithDays:(NSArray *)days;

@end
