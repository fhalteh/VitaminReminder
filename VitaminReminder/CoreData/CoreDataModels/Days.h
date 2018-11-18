//
//  Days.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//
//

#import <CoreData/CoreData.h>
#import "Managed.h"
#import "ManagedObject.h"
#import "DaysDataModel.h"

@class Vitamin;

@interface Days: NSManagedObject <Managed>

@property (nonatomic) BOOL monday;
@property (nonatomic) BOOL tuesday;
@property (nonatomic) BOOL wednesday;
@property (nonatomic) BOOL thursday;
@property (nonatomic) BOOL friday;
@property (nonatomic) BOOL saturday;
@property (nonatomic) BOOL sunday;
@property (nullable, nonatomic, retain) Vitamin *vitamin;

+ (NSString *)weekdayAttribute:(Weekday)weekday;
+ (Weekday)weekdayFromDate:(NSDate *)date;

@end
