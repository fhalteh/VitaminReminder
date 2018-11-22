//
//  AddOrEditVitaminCoordinator.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-19.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "AddOrEditVitaminCoordinator.h"
#import "VitaminDataModel.h"

@interface AddOrEditVitaminCoordinator()

@property (nonatomic, strong) UINavigationController *navController;

@end

@implementation AddOrEditVitaminCoordinator

@synthesize storageManager, rootViewController;

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
                            storageManager:(StorageManager *)storageManager {
    self = [super init];
    if (self) {
        self.rootViewController = rootViewController;
        self.storageManager = storageManager;
    }
    return self;
}

- (void)start {
    VitaminPropertiesViewController *viewController;
    if (self.vitaminDataModel) {
        viewController = [[VitaminPropertiesViewController alloc] initWithDelegate:self vitaminDataModel:self.vitaminDataModel];
    } else {
        viewController = [[VitaminPropertiesViewController alloc] initWithDelegate:self];
    }
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    [self.rootViewController presentViewController:navigationController animated:YES completion:nil];
    self.navController = navigationController;
}

#pragma mark - VitaminPropertiesViewControllerDelegate

- (void)onVitaminPropertiesNextClickedWithVitaminDataModel:(VitaminDataModel *)vitaminDataModel {
    VitaminSchedulerViewController *scheduler = [[VitaminSchedulerViewController alloc] initWithDelegate:self vitaminDataModel:vitaminDataModel];
    [self.navController pushViewController:scheduler animated:YES];
}

- (void)onVitaminPropertiesCancelClicked {
    [self.navController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - VitaminSchedulerViewControllerDelegate

- (void)onVitaminSchedulerCancelClicked {
    [self.navController dismissViewControllerAnimated:YES completion:nil];
}

- (void)onVitaminSchedulerNextClickedWithVitaminDataModel:(VitaminDataModel *)vitaminDataModel {
    VitaminSaverViewController *viewController = [[VitaminSaverViewController alloc] initWithVitaminDelegate:self
                                                                                                   dataModel:vitaminDataModel
                                                                                              storageManager:self.storageManager];
    [self.navController pushViewController:viewController animated:YES];
}

#pragma mark - VitaminSaverViewControllerDelegate

- (void)onVitaminSaverCompleted {
    [self.navController dismissViewControllerAnimated:YES completion:nil];
}


@end
