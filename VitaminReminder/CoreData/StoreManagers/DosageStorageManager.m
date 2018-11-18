//
//  DosageStorageManager.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "DosageStorageManager.h"
#import "Dosage.h"
#import "DosageDataModel.h"
#import "Days.h"

@interface DosageStorageManager()

@property (nonatomic) NSPersistentContainer *persistentContainer;
//@property (nonatomic) NSManagedObjectContext *backgroundContext;

@end

@implementation DosageStorageManager

- (NSManagedObject *)addDataModel:(ObjectDataModel *)dataModel
                        inContext:(NSManagedObjectContext *)context {
    ObjectDataModelType type = [dataModel getType];
    if (type != ObjectDataModelTypeDosage) {
        NSLog(@"An error ocurred. Wrong data model type.");
        return nil;
    }
    DosageDataModel *dosageDataModel = (DosageDataModel *)dataModel;
    Dosage *dosage = [NSEntityDescription insertNewObjectForEntityForName:Dosage.entityName
                                                     inManagedObjectContext:context];
    dosage.numberOfPills = dosageDataModel.numberOfPills;
    dosage.time = dosageDataModel.time;
    return dosage;
}

- (NSArray <Dosage *> *)getDosagesForDay:(Weekday)weekday
                               inContext:(NSManagedObjectContext *)context {
    NSFetchRequest *fetchRequest = Dosage.fetchRequest;
    NSString *weekdayAttribute = [Days weekdayAttribute:weekday];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"vitamin.days.%@ == true", weekdayAttribute];
    NSError *error;
    NSArray *results = [context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"An error occurred while fetching dosages for specific day.");
    }
    return results ? results : @[];
}

// TODO: is this being used, should be removed if not?
//- (NSFetchedResultsController *)loadDosageFetchedResultsController:(id <NSFetchedResultsControllerDelegate>)delegate
//                                                     forDay:(Weekday)weekday
//                                                  inContext:(NSManagedObjectContext *)context {
//    NSFetchRequest *request = [Dosage fetchRequest];
//    request.predicate = [NSPredicate predicateWithFormat:@"vitamin.days.%@ == true",
//                         [Days weekdayAttribute:weekday]];
//    request.sortDescriptors = @[Dosage.defaultSortDescriptor];
//    NSFetchedResultsController *resultsController =
//    [[NSFetchedResultsController alloc]
//     initWithFetchRequest:request
//     managedObjectContext:context
//     sectionNameKeyPath:nil
//     cacheName:nil];
//    resultsController.delegate = delegate;
//    NSError *error;
//    [resultsController performFetch:&error];
//    if (error) {
//        NSLog(@"Could not load the dosages using the fetched results controller.");
//    }
//    return resultsController;
//}

- (void)updateFetchedResultsController:(NSFetchedResultsController *)resultsController
                           withWeekday:(Weekday)weekday {
    resultsController.fetchRequest.predicate =
    [NSPredicate predicateWithFormat:@"vitamin.days.%@ == true",
     [Days weekdayAttribute:weekday]];
    NSError *error;
    [resultsController performFetch:&error];
    if (error) {
        NSLog(@"Could not load the dosages using the fetched results controller.");
    }
}


- (NSArray<ObjectDataModel *> *)fetchAllInContext:(NSManagedObjectContext *)context {
    NSFetchRequest *fetchRequest = Dosage.fetchRequest;
    NSError *error;
    NSArray *results = [context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"An error occurred while fetching all dosages.");
    }
    return results ? results : @[];
}

@end
