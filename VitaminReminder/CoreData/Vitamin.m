//
//  Vitamin.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "Vitamin.h"

@implementation Vitamin

+ (Vitamin *)addVitaminInContext:(NSManagedObjectContext *)context {
    Vitamin *vitamin = [NSEntityDescription insertNewObjectForEntityForName:Vitamin.entityName inManagedObjectContext:context];
    return vitamin;
}

+ (NSFetchRequest<Vitamin *> *)fetchRequest {
    return [NSFetchRequest fetchRequestWithEntityName:Vitamin.entityName];
}

+ (NSFetchedResultsController *)fetchedResultsControllerWithDelegate:(id <NSFetchedResultsControllerDelegate>)delegate
                                                             context:(NSManagedObjectContext *)context {
    NSFetchRequest *request = [self fetchRequest];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
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

@dynamic name;
@dynamic dosage;
@dynamic notes;
@dynamic vitaminIntakes;

@end
