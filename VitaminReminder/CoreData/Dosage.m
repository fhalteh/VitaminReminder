//
//  Dosage.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "Dosage.h"

@implementation Time

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject:self.hours forKey:@"hours"];
    [aCoder encodeObject:self.minutes forKey:@"minutes"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.hours = [aDecoder decodeObjectForKey:@"hours"];
        self.minutes = [aDecoder decodeObjectForKey:@"minutes"];
    }
    return self;
}

@end

@implementation Dosage

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject:self.numberOfPills forKey:@"numberOfPills"];
    [aCoder encodeObject:self.reminderTime forKey:@"reminderTime"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.numberOfPills = [aDecoder decodeObjectForKey:@"numberOfPills"];
        self.reminderTime = [aDecoder decodeObjectForKey:@"reminderTime"];
    }
    return self;
}

//- (NSString *)getTimeAsString {
//    return [NSString stringWithFormat:@"%@:%@", self.reminderTime.hours, self.reminderTime.minutes];
//}
//
@end
