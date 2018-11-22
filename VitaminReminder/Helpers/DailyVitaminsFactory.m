//
//  VitaminListGenerator.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "DailyVitaminsFactory.h"
#import "Vitamin.h"
#import "VitaminIntake.h"
#import "Dosage.h"
#import "VitaminIntakeCellModel.h"
#import "NSDate+Utils.h"
#import "StorageManager.h"
#import "Days.h"
#import "UserVitaminIntake.h"

@implementation DailyVitaminsFactory

+ (NSArray <VitaminIntakeCellModel *> *)createVitaminsListFromStorageManager:(StorageManager *)storageManager

                                                                 date:(NSDate *)date {
    Weekday weekday = [Days weekdayFromDate:date];
    NSArray <Dosage *> *dosages = [storageManager getDosagesForDay:weekday];
    NSArray <UserVitaminIntake *> *intakes = [storageManager getIntakesForDate:date];
    NSMutableArray <VitaminIntakeCellModel *> *vitaminIntakeCellModels = [NSMutableArray new];
    for (Dosage *dosage in dosages) {
        VitaminIntakeCellModel *model = [VitaminIntakeCellModel new];
        model.vitaminName = dosage.vitamin.name;
        model.time = dosage.time.inHoursAndMinutes;
        model.dosageObjectID = dosage.objectID;
        model.intakeDate = [self intakeTimeFromUserVitaminIntakes:intakes containsDosage:dosage];
        [vitaminIntakeCellModels addObject:model];
    }
    return vitaminIntakeCellModels;
}

+ (NSDate *)intakeTimeFromUserVitaminIntakes:(NSArray <UserVitaminIntake *> *)intakes
                              containsDosage:(Dosage *)dosage {
    for (UserVitaminIntake *intake in intakes) {
        if ([intake.dosage.vitamin.name isEqualToString:dosage.vitamin.name]) {
            return intake.intakeDate;
        }
    }
    return nil;
}

@end
