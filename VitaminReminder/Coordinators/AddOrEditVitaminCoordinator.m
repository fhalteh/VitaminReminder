//
//  AddOrEditVitaminCoordinator.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-19.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "AddOrEditVitaminCoordinator.h"

//#import "VitaminPropertiesContentViewController.h"

@implementation AddOrEditVitaminCoordinator

// TODO: root view controller?
@synthesize navController, storageManager, rootViewController;

// Should be able to initialize it with the vitamin details
- (instancetype)initWithNavigationController:(UINavigationController *)navigationController
                              storageManager:(StorageManager *)storageManager {
    self = [super init];
    if (self) {
        self.navController = navigationController;
        self.storageManager = storageManager;
    }
    return self;
}

- (void)start {
    // start the vitamin properties view controller
    VitaminPropertiesViewController *viewController = [[VitaminPropertiesViewController alloc] initWithDelegate:self];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    // TODO: should add delegate -> self
    [self.navController presentViewController:navigationController animated:YES completion:nil];
    self.navController = navigationController;
//    [self.navController showViewController:viewController sender:self];
    
}

#pragma mark - VitaminPropertiesViewControllerDelegate

- (void)onVitaminPropertiesNextClickedWithVitaminDataModel:(VitaminDataModel *)vitaminDataModel {
    VitaminSchedulerViewController *scheduler = [[VitaminSchedulerViewController alloc] initWithDelegate:self vitaminDataModel:vitaminDataModel];
    [self.navController pushViewController:scheduler animated:YES];
}

// TODO: instead, use the vitamin properties
//- (void)onVitaminPropertiesNextClickedWithVitaminName:(NSString *)vitaminName {
//    NSLog(@"Vitamin name");
//    // Maybe we should have an instance of the view controller
//    VitaminSchedulerViewController *scheduler = [[VitaminSchedulerViewController alloc] initWithDelegate:self
//                                                                                             vitaminName:vitaminName];
//    [self.navController pushViewController:scheduler animated:YES];
//}

- (void)onVitaminPropertiesCancelClicked {
    NSLog(@"cancel");
    [self.navController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - VitaminSchedulerViewControllerDelegate

- (void)onVitaminSchedulerCancelClicked {
    [self.navController dismissViewControllerAnimated:YES completion:nil];
}

- (void)onVitaminSchedulerNextClickedWithVitaminDataModel:(VitaminDataModel *)vitaminDataModel {
    NSLog(@"completed the vitamin scheduler now add to the database");
    NSLog(@"Vitamin data model should be updated: %@", vitaminDataModel);
    // Push the view controller adding to the database?
    
    VitaminSaverViewController *viewController = [[VitaminSaverViewController alloc] initWithVitaminDelegate:self
                                                                                                   dataModel:vitaminDataModel
                                                                                              storageManager:self.storageManager];
    [self.navController pushViewController:viewController animated:YES];
}

- (void)onVitaminSaverCompleted {
    [self.navController dismissViewControllerAnimated:YES completion:nil];
}


//- (void)onVitaminSchedulerNextClickedWithVitaminName:(NSString *)vitaminName {
//    // TODO: it's not oging to be with vitamin name
//}
//
// on frequency clikced with days data model?
//- (void)onFrequencyClicked {
//    // TODO: push the view controller
//
//    // Present the view controller with frequency
//}

//- (void)onAddDosageClicked {
//    // TODO: show the view controller -> add dosage?
//}



@end
