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

//@property (nonatomic) UINavigationController *navController;
@property (nonatomic) TabBarCoordinator *tabBarCoordinator;

@end

@implementation AppCoordinator

@synthesize storageManager;

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController
                                   container:(NSPersistentContainer *)container {
    self = [super init];
    if (self) {
        self.navController = navigationController;
        self.storageManager = [[StorageManager alloc] initWithContainer:container];
        self.tabBarCoordinator = [[TabBarCoordinator alloc] initWithNavigationController:navigationController
                                                                          storageManager:self.storageManager];
    }
    return self;
}

//- (instancetype)initWithNavigationController:(UINavigationController *)navigationController  {
//    self = [super init];
//    if (self) {
//        self.navController = navigationController;
//        self.storageManager = storageManager;
//        self.tabBarCoordinator = [[TabBarCoordinator alloc] initWithNavigationController:navigationController storageManager:storageManager];
//    }
//    return self;
//}

- (void)start {
    // Check if the user has logged in before or not
    
    BOOL isFirstLaunch = [NSUserDefaults isFirstLaunchEver];
    isFirstLaunch = YES; // TODO: remove
    if (isFirstLaunch) {
        [self showFirstLaunchViewController];
    } else {
        [self.tabBarCoordinator start];
    }
    // Create random view controllers
//    MainViewController *vc1 = [[MainViewController alloc] initWithNibName:MainViewController.identifier bundle:nil];
//    UIStoryboard *storyBoard = self.navController.storyboard;
//    MainViewController *vc1 = [storyBoard instantiateViewControllerWithIdentifier:MainViewController.identifier];
//
//    // TODO: create the proper Veiw controllers
////    UIViewController *vc1 = [UIViewController new];
//    vc1.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemRecents tag:0];
//
//    UIViewController *vc2 = [UIViewController new];
//    vc2.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:1];
//    MainTabBarController *controller = [[MainTabBarController alloc] initWithViewControllers:@[vc1, vc2] delegate:self];
//    [controller setTabViewControllers:@[vc1, vc2]];
//    [self.navController showViewController:controller sender:self];
}

- (void)showFirstLaunchViewController {
    WelcomeViewController *viewController = [[WelcomeViewController alloc] initWithDelegate:self];
    [self.navController showViewController:viewController sender:self];
}

- (void)didSelectItemWithIndex:(int)index {
    // remove this method
}

#pragma mark - WelcomeViewControllerDelegate

- (void)onWelcomeViewControllerNextButtonClicked {
    [self.navController dismissViewControllerAnimated:YES completion:^{
        [self.tabBarCoordinator start];
    }];
}

@synthesize navController;

@end


