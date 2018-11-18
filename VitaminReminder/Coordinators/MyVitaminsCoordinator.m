//
//  MyVitaminsCoordinator.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "MyVitaminsCoordinator.h"
#import "VitaminsViewController.h"
#import "AllVitaminsTableVC.h"

@implementation MyVitaminsCoordinator

@synthesize navController, storageManager;

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController storageManager:(StorageManager *)storageManager {
    self = [super init];
    if (self) {
        self.navController = navigationController;
        self.storageManager = storageManager;
    }
    return self;
}

- (UIViewController *)rootViewController {
    // init with the storage manager
    // TODO: change from context to store manager
    VitaminsViewController *viewController = [[VitaminsViewController alloc] initWithStorageManager:self.storageManager];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    return navigationController;
//    return [[VitaminsViewController alloc] init];
}

@end
