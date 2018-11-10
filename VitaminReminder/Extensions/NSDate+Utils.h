//
//  NSDate+Utils.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Utils)

+ (NSDate *)dateFromHours:(int)hours minutes:(int)minutes;
- (NSString *)inHoursAndMinutes;
- (NSDate *)startOfDay;
- (NSDate *)endOfDay;

@end
