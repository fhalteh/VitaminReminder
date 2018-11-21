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

- (void)onVitaminPropertiesNextClickedWithVitaminName:(NSString *)vitaminName {
    NSLog(@"Vitamin name");
    VitaminSchedulerViewController *scheduler = [[VitaminSchedulerViewController alloc] initWithDelegate:self vitaminName:vitaminName];
    [self.navController pushViewController:scheduler animated:YES];
}

- (void)onVitaminPropertiesCancelClicked {
    NSLog(@"cancel");
    [self.navController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - VitaminSchedulerViewControllerDelegate

- (void)onVitaminSchedulerCancelClicked {
    [self.navController dismissViewControllerAnimated:YES completion:nil];
}

- (void)onVitaminSchedulerNextClickedWithVitaminName:(NSString *)vitaminName {
    // TODO: it's not oging to be with vitamin name
}

// on frequency clikced with days data model?
- (void)onFrequencyClicked {
    // TODO: push the view controller
}



@end
