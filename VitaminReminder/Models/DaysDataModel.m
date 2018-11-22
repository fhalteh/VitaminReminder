//
//  DaysDataModel.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "DaysDataModel.h"
#import "Days.h"

#define TOTAL_NUMBER_OF_DAYS    7

@implementation DaysDataModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.selectedDays = [NSMutableArray new];
    }
    return self;
}

- (instancetype)initWithDays:(Days *)days {
    self = [super init];
    if (self) {
        self.selectedDays = [self selectedDaysFromDays:days];
    }
    return self;
}

- (NSMutableArray <NSNumber *> *)selectedDaysFromDays:(Days *)days {
    NSMutableArray *selectedDays = [NSMutableArray new];
    if (days.sunday) {
        [selectedDays addObject:@(WeekdaySunday)];
    }
    if (days.monday) {
        [selectedDays addObject:@(WeekdayMonday)];
    }
    if (days.tuesday) {
        [selectedDays addObject:@(WeekdayTuesday)];
    }
    if (days.wednesday) {
        [selectedDays addObject:@(WeekdayWednesday)];
    }
    if (days.thursday) {
        [selectedDays addObject:@(WeekdayThursday)];
    }
    if (days.friday) {
        [selectedDays addObject:@(WeekdayFriday)];
    }
    if (days.saturday) {
        [selectedDays addObject:@(WeekdaySaturday)];
    }
    return selectedDays;
}

+ (DaysDataModel *)daysDataModelWithDays:(NSArray *)days {
    
    DaysDataModel *dataModal = [[DaysDataModel alloc] init];
    dataModal.selectedDays = [NSMutableArray arrayWithArray:days];
    return dataModal;
}

- (BOOL)isWeekdaySelected:(Weekday)weekday {
    return [self.selectedDays containsObject:@(weekday)];
}

- (void)updateWeekday:(Weekday)weekday selected:(BOOL)selected {
    if (selected) {
        BOOL isSelected = [self.selectedDays containsObject:@(weekday)];
        if (!isSelected) {
            [self.selectedDays addObject:@(weekday)];
        }
    } else {
        [self.selectedDays removeObject:@(weekday)];
    }
}

+ (NSString *)getTitle:(Weekday)weekday {
    switch (weekday) {
        case WeekdaySunday:
            return @"Sunday";
        case WeekdayMonday:
            return @"Monday";
        case WeekdayTuesday:
            return @"Tuesday";
        case WeekdayWednesday:
            return @"Wednesday";
        case WeekdayThursday:
            return @"Thursday";
        case WeekdayFriday:
            return @"Friday";
        case WeekdaySaturday:
            return @"Saturday";
    }
    return @"";
}

- (BOOL)isEverydaySelected {
    return self.selectedDays.count == TOTAL_NUMBER_OF_DAYS;
}

- (BOOL)noneSelected {
    return self.selectedDays.count == 0;
}

- (NSString *)daysString {
    if (self.selectedDays.count == 0) {
        return @"None";
    }
    NSString *daysString = @"";
    for (NSNumber *day in self.selectedDays) {
        NSString *title = [DaysDataModel getTitle:day.intValue];
        title = [title substringToIndex:2];
        daysString = [daysString stringByAppendingString:title];
        daysString = [daysString stringByAppendingString:@" "];
    }
    return daysString;
}

- (BOOL)monday {
    return [self.selectedDays containsObject:@(WeekdayMonday)];
}

- (BOOL)tuesday {
    return [self.selectedDays containsObject:@(WeekdayTuesday)];
}

- (BOOL)wednesday {
    return [self.selectedDays containsObject:@(WeekdayWednesday)];
}

- (BOOL)thursday {
    return [self.selectedDays containsObject:@(WeekdayThursday)];
}

- (BOOL)friday {
    return [self.selectedDays containsObject:@(WeekdayFriday)];
}

- (BOOL)saturday {
    return [self.selectedDays containsObject:@(WeekdaySaturday)];
}

- (BOOL)sunday {
    return [self.selectedDays containsObject:@(WeekdaySunday)];
}

- (ObjectDataModelType)getType {
    return ObjectDataModelTypeDays;
}

@end
