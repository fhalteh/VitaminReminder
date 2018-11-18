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

@implementation VitaminListGenerator

// TODO:
+ (NSArray <VitaminIntakeCellModel *> *)createVitaminsListFromContext:(NSManagedObjectContext *)context
                                      date:(NSDate *)date {
    NSArray <Vitamin *> *vitamins = [Vitamin fetchVitaminsInManagedObjectContext:context];
//    NSArray <VitaminIntake *> *vitaminIntakes = [VitaminIntake fetchVitaminIntakesOnDate:date
//                                                inManagedObjectContext:context];
    NSMutableArray <VitaminIntakeCellModel *> *vitaminIntakeCellModels = [NSMutableArray new];
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
