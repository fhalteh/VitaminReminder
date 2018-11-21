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
// TODO: maybe the days data model should be converted to a list of days instead?

// List of enums basically and that's it?

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
//    dataModal.monday = [days containsObject:@(WeekdayMonday)];
//    dataModal.tuesday = [days containsObject:@(WeekdayTuesday)];
//    dataModal.wednesday = [days containsObject:@(WeekdayWednesday)];
//    dataModal.thursday = [days containsObject:@(WeekdayThursday)];
//    dataModal.friday = [days containsObject:@(WeekdayFriday)];
//    dataModal.saturday = [days containsObject:@(WeekdaySaturday)];
//    dataModal.sunday = [days containsObject:@(WeekdaySunday)];
    return dataModal;
}

- (BOOL)isWeekdaySelected:(Weekday)weekday {
    return [self.selectedDays containsObject:@(weekday)];
//    switch (weekday) {
//        case WeekdaySunday:
//            return self.sunday;
//        case WeekdayMonday:
//            return self.monday;
//        case WeekdayTuesday:
//            return self.tuesday;
//        case WeekdayWednesday:
//            return self.wednesday;
//        case WeekdayThursday:
//            return self.thursday;
//        case WeekdayFriday:
//            return self.friday;
//        case WeekdaySaturday:
//            return self.saturday;
//    }
//    return NO;
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
//
//    switch (weekday) {
//        case WeekdaySunday:
//            self.sunday = selected;
//            break;
//        case WeekdayMonday:
//            self.monday = selected;
//            break;
//        case WeekdayTuesday:
//            self.tuesday = selected;
//            break;
//        case WeekdayWednesday:
//            self.wednesday = selected;
//            break;
//        case WeekdayThursday:
//            self.thursday = selected;
//            break;
//        case WeekdayFriday:
//            self.friday = selected;
//            break;
//        case WeekdaySaturday:
//            self.saturday = selected;
//            break;
//    }
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
//    if (!self.sunday) {
//        return false;
//    }
//    if (!self.monday) {
//        return false;
//    }
//    if (!self.tuesday) {
//        return false;
//    }
//    if (!self.wednesday) {
//        return false;
//    }
//    if (!self.thursday) {
//        return false;
//    }
//    if (!self.friday) {
//        return false;
//    }
//    if (!self.saturday) {
//        return false;
//    }
//    return true;
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
    
    
//    if (self.sunday) {
//        daysString = [daysString stringByAppendingString:@"Su"];
//        daysString = [daysString stringByAppendingString:@" "];
//    }
//    if (self.monday) {
//        daysString = [daysString stringByAppendingString:@"Mo"];
//        daysString = [daysString stringByAppendingString:@" "];
//    }
//    if (self.tuesday) {
//        daysString = [daysString stringByAppendingString:@"Tu"];
//        daysString = [daysString stringByAppendingString:@" "];
//    }
//    if (self.wednesday) {
//        daysString = [daysString stringByAppendingString:@"We"];
//        daysString = [daysString stringByAppendingString:@" "];
//    }
//    if (self.thursday) {
//        daysString = [daysString stringByAppendingString:@"Th"];
//        daysString = [daysString stringByAppendingString:@" "];
//    }
//    if (self.friday) {
//        daysString = [daysString stringByAppendingString:@"Fr"];
//        daysString = [daysString stringByAppendingString:@" "];
//    }
//    if (self.saturday) {
//        daysString = [daysString stringByAppendingString:@"Sa"];
//        daysString = [daysString stringByAppendingString:@" "];
//    }
//    return daysString;
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
