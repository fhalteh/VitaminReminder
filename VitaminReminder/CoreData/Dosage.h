//
//  Dosage.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>

// TODO: delete me?
@interface Time : NSObject <NSCoding>

@property NSNumber *hours;
@property NSNumber *minutes;

@end

@interface Dosage : NSObject <NSCoding>

@property NSNumber *numberOfPills;
@property NSDate *reminderTime; // TODO: should be changed to NSDate

//- (NSString *)getTimeAsString;

@end
