//
//  VitaminIntake.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "VitaminIntake.h"
#import "NSDate+Utils.h"

//@implementation VitaminIntake
//
//+ (VitaminIntake *)addVitaminIntakeInContext:(NSManagedObjectContext *)context {
//    VitaminIntake *vitaminIntake = [NSEntityDescription insertNewObjectForEntityForName:VitaminIntake.entityName inManagedObjectContext:context];
//    return vitaminIntake;
//}
//
//+ (NSFetchRequest<VitaminIntake *> *)fetchRequest {
//    return [NSFetchRequest fetchRequestWithEntityName:VitaminIntake.entityName];
//}
//
//+ (NSArray <VitaminIntake *> *)fetchVitaminIntakesOnDate:(NSDate *)date
//                                  inManagedObjectContext:(NSManagedObjectContext *)context {
//    NSFetchRequest *request = [self fetchRequest];
//    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
//    currentCalendar.timeZone = NSTimeZone.localTimeZone;
//    NSDate *startOfDay = date.startOfDay;
//    NSDate *endOfDay = date.endOfDay;
//    request.predicate = [NSPredicate predicateWithFormat:@"intakeDate >= %@ && intakeDate <= %@", startOfDay, endOfDay];
//    NSError *error = nil;
//    return [[context executeFetchRequest:request error:&error] mutableCopy];
//
//}
//
//+ (NSString *)entityName {
//    return @"VitaminIntake";
//}
//
//@dynamic intakeDate;
//@dynamic vitamin;
//
//@end
