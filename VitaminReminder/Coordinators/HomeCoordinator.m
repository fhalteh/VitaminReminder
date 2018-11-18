//
//  HomeCoordinator.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "HomeCoordinator.h"
#import "MainViewController.h"

@implementation HomeCoordinator

- (UIViewController *)rootViewController {
    // TODO: rename main view controller
//    MainViewController *vc1 = [[MainViewController alloc] initWithNibName:MainViewController.identifier bundle:nil];
    UIStoryboard *storyBoard = self.navController.storyboard;
    MainViewController *vc1 = [storyBoard instantiateViewControllerWithIdentifier:MainViewController.identifier];
//    vc1.title = @"HOME";
    vc1.navigationItem.title = @"IS THIS";
    
    return vc1;
}

@synthesize navController, storageManager;

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController storageManager:(StorageManager *)storageManager{
    self = [super init];
    if (self) {
        self.navController = navigationController;
        self.storageManager = storageManager;
//        self.navController.navigationItem.title = @"HEY";
//        self.navController.title = @"hey";
    }
    return self;
}

- (void)start {
    
}

@end
