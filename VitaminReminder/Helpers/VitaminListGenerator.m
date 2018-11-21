//
//  VitaminListGenerator.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "VitaminListGenerator.h"
#import "Vitamin.h"
#import "VitaminIntake.h"
#import "Dosage.h"
#import "VitaminIntakeCellModel.h"
#import "NSDate+Utils.h"
#import "StorageManager.h"
#import "Days.h"
#import "UserVitaminIntake.h"

@implementation VitaminListGenerator

+ (BOOL)vitaminIntakes:(NSArray <UserVitaminIntake *> *)intakes
        containsDosage:(Dosage *)dosage {
    for (UserVitaminIntake *intake in intakes) {
        if ([intake.dosage.vitamin.name isEqualToString:dosage.vitamin.name]) {
            return YES;
        }
    }
    return NO;
}

// TODO: should remove
+ (NSArray <VitaminIntakeCellModel *> *)createVitaminsListFromContext:(StorageManager *)storageManager

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
        model.taken = [self vitaminIntakes:intakes containsDosage:dosage];
        [vitaminIntakeCellModels addObject:model];
    }

//    NSArray <Vitamin *> *vitamins = [Vitamin fetchVitaminsInManagedObjectContext:context];
////    NSArray <VitaminIntake *> *vitaminIntakes = [VitaminIntake fetchVitaminIntakesOnDate:date
////                                                inManagedObjectContext:context];
//    NSMutableArray <VitaminIntakeCellModel *> *vitaminIntakeCellModels = [NSMutableArray new];
//    for (Vitamin *vitamin in vitamins) {
//        for (Dosage *dosage in vitamin.dosage) {
//            VitaminIntakeCellModel *model = [VitaminIntakeCellModel new];
//            model.vitamin = vitamin;
//            model.timeAsText = dosage.reminderTime.inHoursAndMinutes;
//            model.taken = [self vitaminIntakes:vitaminIntakes
//                               containsVitamin:vitamin];
//            [vitaminIntakeCellModels addObject:model];
//        }
//    }
    return vitaminIntakeCellModels;
}

//+ (BOOL)vitaminIntakes:(NSArray <VitaminIntake *> *)vitaminIntakes
//       containsVitamin:(Vitamin *)vitamin {
//    NSString *vitaminName = vitamin.name;
//    for (VitaminIntake *vitaminIntake in vitaminIntakes) {
//        if ([vitaminIntake.vitamin.name isEqualToString:vitaminName]) {
//            return YES;
//        }
//    }
//    return NO;
//}

@end
