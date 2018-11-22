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

@synthesize storageManager, rootViewController;

- (UIViewController *)rootViewController {
    MainViewController *viewController = [[MainViewController alloc] init];
    viewController.storageManager = storageManager;
    return [[UINavigationController alloc] initWithRootViewController:viewController];
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController storageManager:(StorageManager *)storageManager {
    self = [super init];
    if (self) {
        self.rootViewController = rootViewController;
        self.storageManager = storageManager;
    }
    return self;
}


@end
