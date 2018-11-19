//
//  HomeCoordinator.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "HomeCoordinator.h"
#import "MainViewController.h"
#import "VitaminIntakePagingViewController.h"

@implementation HomeCoordinator

@synthesize navController, storageManager, rootViewController;

- (UIViewController *)rootViewController {
    MainViewController *viewController = [[MainViewController alloc] init];
    viewController.storageManager = storageManager;
    return viewController;
}

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController storageManager:(StorageManager *)storageManager{
    self = [super init];
    if (self) {
        self.navController = navigationController;
        self.storageManager = storageManager;
    }
    return self;
}

// TODO: remove start
- (void)start {
    
}

@end
