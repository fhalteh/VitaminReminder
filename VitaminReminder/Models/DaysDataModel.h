//
//  DaysDataModel.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjectDataModel.h"

typedef enum : NSUInteger {
    WeekdaySunday = 1,
    WeekdayMonday,
    WeekdayTuesday,
    WeekdayWednesday,
    WeekdayThursday,
    WeekdayFriday,
    WeekdaySaturday,
} Weekday;

@interface DaysDataModel : ObjectDataModel

@property (nonatomic) BOOL monday;
@property (nonatomic) BOOL tuesday;
@property (nonatomic) BOOL wednesday;
@property (nonatomic) BOOL thursday;
@property (nonatomic) BOOL friday;
@property (nonatomic) BOOL saturday;
@property (nonatomic) BOOL sunday;

- (BOOL)isEverydaySelected;
- (NSString *)daysString;
+ (DaysDataModel *)daysDataModelWithDays:(NSArray *)days;

@end
