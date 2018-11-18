//
//  DaysStorageManager.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "DaysStorageManager.h"
#import "Days.h"
#import "DaysDataModel.h"

@implementation DaysStorageManager

//@synthesize fetchRequest;

//- (NSFetchRequest *)fetchRequest {
//    return Days.fetchRequest;
//}

- (NSManagedObject *)addDataModel:(ObjectDataModel *)dataModel
                        inContext:(NSManagedObjectContext *)context {
    ObjectDataModelType type = [dataModel getType];
    if (type != ObjectDataModelTypeDays) {
        NSLog(@"An error ocurred. Wrong data model type.");
        return nil;
    }
    
    DaysDataModel *daysDataModel = (DaysDataModel *)dataModel;
    Days *days = [NSEntityDescription insertNewObjectForEntityForName:Days.entityName
                                                   inManagedObjectContext:context];
    days.monday = daysDataModel.monday;
    days.tuesday = daysDataModel.tuesday;
    days.wednesday = daysDataModel.wednesday;
    days.thursday = daysDataModel.thursday;
    days.friday = daysDataModel.friday;
    days.saturday = daysDataModel.saturday;
    days.sunday = daysDataModel.sunday;
    return days;
}

- (NSArray<ObjectDataModel *> *)fetchAllInContext:(NSManagedObjectContext *)context { 
    NSFetchRequest *fetchRequest = Days.fetchRequest;
    NSError *error;
    NSArray *results = [context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"An error occurred while fetching all days intakes.");
    }
    return results ? results : @[];
}

@end


