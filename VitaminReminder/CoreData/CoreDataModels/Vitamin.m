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

// TODO: remove methods that are no longer required
+ (Vitamin *)addVitaminInContext:(NSManagedObjectContext *)context {
    return [[Vitamin alloc] initWithContext:context];
}

// TODO: is this being used?
+ (NSFetchedResultsController *)fetchedResultsControllerWithDelegate:(id <NSFetchedResultsControllerDelegate>)delegate
                                                             context:(NSManagedObjectContext *)context {
    NSFetchRequest *request = [self fetchRequest];
    request.sortDescriptors = @[Vitamin.defaultSortDescriptor];
    NSFetchedResultsController *resultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];
    resultsController.delegate = delegate;
    return resultsController;
}

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
