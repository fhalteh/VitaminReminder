//
//  Dosage.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//
//

#import "Dosage.h"

@implementation Dosage

+ (NSFetchRequest<Dosage *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Dosage"];
}

@dynamic numberOfPills;
@dynamic time;
@dynamic intakes;
@dynamic vitamin;

+ (NSString *)entityName {
    return @"Dosage";
}

+ (NSSortDescriptor *)defaultSortDescriptor {
    return [NSSortDescriptor sortDescriptorWithKey:@"time" ascending:YES];
}

@end
