//
//  DosageDataSource.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "DosageDataSource.h"
#import "Dosage.h"

// delete me
@implementation DosageDataSource

- (Dosage *)addInContext:(NSManagedObjectContext *)context {
    return [NSEntityDescription insertNewObjectForEntityForName:Dosage.entityName
                                         inManagedObjectContext:context];
    
}

//- (id <Managed>)add:(id<Managed>)object inContext:(NSManagedObjectContext *)context {
//    return [NSEntityDescription insertNewObjectForEntityForName:Dosage.entityName
//                                  inManagedObjectContext:context];
//}

- (NSArray<id<Managed>> *)getAllInContext:(NSManagedObjectContext *)context {
    NSError *error;
    NSArray *dosages = [context executeFetchRequest:Dosage.fetchRequest error:&error];
    NSLog(@"Error produced while getting all dosages: %@", error);
    return dosages;
}

@end
