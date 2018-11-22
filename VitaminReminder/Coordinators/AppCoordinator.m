//
//  AppCoordinator.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "AppCoordinator.h"
#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "TabBarCoordinator.h"
#import "StorageManager.h"
#import "NSUserDefaults+Utils.h"

@interface AppCoordinator()

@property (nonatomic) TabBarCoordinator *tabBarCoordinator;

@end

@implementation AppCoordinator

@synthesize storageManager, rootViewController;

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
                                 container:(NSPersistentContainer *)container {
    self = [super init];
    if (self) {
        self.rootViewController = rootViewController;
        self.storageManager = [[StorageManager alloc] initWithContainer:container];
        self.tabBarCoordinator = [[TabBarCoordinator alloc] initWithRootViewController:rootViewController
                                                                          storageManager:self.storageManager];
    }
    return self;
}

- (void)start {
    BOOL isFirstLaunch = [NSUserDefaults isFirstLaunchEver];
    if (isFirstLaunch) {
        [self showFirstLaunchViewController];
    } else {
        [self.tabBarCoordinator start];
    }
}

- (void)showFirstLaunchViewController {
    WelcomeViewController *viewController = [[WelcomeViewController alloc] initWithDelegate:self];
    [self.rootViewController showViewController:viewController sender:self];
}

#pragma mark - WelcomeViewControllerDelegate

- (void)onWelcomeViewControllerNextButtonClicked {
    [self.rootViewController dismissViewControllerAnimated:YES completion:^{
        [self.tabBarCoordinator start];
    }];
}


@end


