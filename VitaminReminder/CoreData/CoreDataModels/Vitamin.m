//
//  Vitamin.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//
//

#import "Vitamin.h"

@implementation Vitamin

+ (NSString *)entityName {
    return @"Vitamin";
}

+ (NSArray <Vitamin *> *)fetchVitaminsInManagedObjectContext:(NSManagedObjectContext *)context {
    NSFetchRequest *request = [self fetchRequest];
    NSError *error = nil;
    return [[context executeFetchRequest:request error:&error] mutableCopy];
}

+ (NSFetchRequest<Vitamin *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:Vitamin.entityName];
}

+ (NSSortDescriptor *)defaultSortDescriptor {
    return [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
}

@dynamic name;
@dynamic notes;
@dynamic color;
@dynamic days;
@dynamic dosages;

@end
