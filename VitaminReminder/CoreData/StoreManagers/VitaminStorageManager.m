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

@interface VitaminStorageManager()

@property (nonatomic) DosageStorageManager *dosageStorageManager;
@property (nonatomic) DaysStorageManager *daysStorageManager;


@end

@implementation VitaminStorageManager

- (NSFetchedResultsController *)loadVitaminsFetchedResultsController:(id <NSFetchedResultsControllerDelegate>)delegate
                                                           inContext:(NSManagedObjectContext *)context {
    // TODO: ask the vitamins storage manager to do that
    NSFetchRequest *request = [Vitamin fetchRequest];
    // TODO: change name to -> sort descriptro default
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

//- (NSFetchRequest *)fetchRequest {
//    return Vitamin.fetchRequest;
//}
//
////
////- (__kindof NSManagedObject *)addDataModel:(id)dataModel {
////    <#code#>
////}
////
////- (NSArray<ObjectDataModel *> *)fetchAll {
////    <#code#>
////}
////
////- (instancetype)initWithContainer:(NSPersistentContainer *)container {
////    <#code#>
////}
////
////- (void)remove:(NSManagedObjectID *)objectID {
////    <#code#>
////}
////
////- (void)save {
////    <#code#>
////}
//
//
//- (__kindof NSManagedObject *)addDataModel:(ObjectDataModel *)dataModel {
//    ObjectDataModelType type = [dataModel getType];
//    if (type != ObjectDataModelTypeVitamin) {
//        NSLog(@"An error ocurred. Wrong data model type.");
//        return nil;
//    }
//
//    VitaminDataModel *vitaminDataModel = (VitaminDataModel *)dataModel;
//    Vitamin *vitamin = [NSEntityDescription insertNewObjectForEntityForName:Vitamin.entityName
//                                                     inManagedObjectContext:self.backgroundContext];
//    vitamin.name = vitaminDataModel.name;
//    vitamin.notes = vitaminDataModel.notes;
//    vitamin.color = vitaminDataModel.color;
//    // Create days data model and dosages
//    // Create days
//
////    @property (nonatomic, strong) NSString *name;
////    @property (nonatomic, strong) NSString *notes;
////    @property (nonatomic) AppearanceColor color;
////    @property (nonatomic, strong) DaysDataModel *days;
////    @property (nonatomic, strong) NSArray <DosageDataModel *> *dosages;
//
//    // Add the data based on the model
//
//
//
//    return vitamin;
////    dosage.numberOfPills = dosageDataModel.numberOfPills;
////    dosage.time = dosageDataModel.time;
////    return dosage;
//
//
//}

- (NSManagedObject *)addDataModel:(ObjectDataModel *)dataModel
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
    
    
    // TODO: add the dosages?
    DaysStorageManager *daysStorageManager = [DaysStorageManager new];
    // maybe add data model should nsmanagedobject?
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

- (NSArray<ObjectDataModel *> *)fetchAllInContext:(NSManagedObjectContext *)context {
    NSFetchRequest *fetchRequest = Vitamin.fetchRequest;
    NSError *error;
    NSArray *results = [context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"An error occurred while fetching all dosages.");
    }
    return results ? results : @[];

}

@end
