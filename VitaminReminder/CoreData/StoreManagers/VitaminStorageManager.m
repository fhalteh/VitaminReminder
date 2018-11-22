//
//  VitaminStorageManager.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "VitaminStorageManager.h"
#import "Vitamin.h"
#import "VitaminDataModel.h"
#import "DosageStorageManager.h"
#import "DaysStorageManager.h"
#import "Dosage.h"

@interface VitaminStorageManager()

@property (nonatomic) DosageStorageManager *dosageStorageManager;
@property (nonatomic) DaysStorageManager *daysStorageManager;


@end

@implementation VitaminStorageManager

- (NSFetchedResultsController *)loadVitaminsFetchedResultsController:(id <NSFetchedResultsControllerDelegate>)delegate
                                                           inContext:(NSManagedObjectContext *)context {
    NSFetchRequest *request = [Vitamin fetchRequest];
    request.sortDescriptors = @[Vitamin.defaultSortDescriptor];
    NSFetchedResultsController *resultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                                        managedObjectContext:context
                                                                                          sectionNameKeyPath:nil
                                                                                                   cacheName:nil];
    resultsController.delegate = delegate;
    NSError *error = nil;
    [resultsController performFetch:&error];
    if (error) {
        NSLog(@"Could not load the vitamins using the fetched results controller.");
    }
    return resultsController;
}

- (NSManagedObject *)addDataModel:(id <ObjectDataModel>)dataModel
                                 inContext:(NSManagedObjectContext *)context {
    ObjectDataModelType type = [dataModel getType];
    if (type != ObjectDataModelTypeVitamin) {
        NSLog(@"An error ocurred. Wrong data model type.");
        return nil;
    }
    
    VitaminDataModel *vitaminDataModel = (VitaminDataModel *)dataModel;
    Vitamin *vitamin = [NSEntityDescription insertNewObjectForEntityForName:Vitamin.entityName
                                                     inManagedObjectContext:context];
    vitamin.name = vitaminDataModel.name;
    vitamin.notes = vitaminDataModel.notes;
    vitamin.color = @(vitaminDataModel.color);
    
    DaysStorageManager *daysStorageManager = [DaysStorageManager new];
    DaysDataModel *daysDataModel = vitaminDataModel.days;
    vitamin.days = (Days *)[daysStorageManager addDataModel:daysDataModel
                                                  inContext:context];
    
    DosageStorageManager *dosageStorageManager = [DosageStorageManager new];
    for (DosageDataModel *dosageDataModel in vitaminDataModel.dosages) {
        Dosage *dosage = (Dosage *)[dosageStorageManager addDataModel:dosageDataModel
                                                            inContext:context];
        [vitamin addDosagesObject:dosage];
    }
    return vitamin;
}

- (NSArray<id <ObjectDataModel>> *)fetchAllInContext:(NSManagedObjectContext *)context {
    NSFetchRequest *fetchRequest = Vitamin.fetchRequest;
    NSError *error;
    NSArray *results = [context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"An error occurred while fetching all dosages.");
    }
    return results ? results : @[];

}

@end
