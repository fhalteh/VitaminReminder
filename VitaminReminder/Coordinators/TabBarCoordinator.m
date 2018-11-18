//
//  TabBarCoordinator.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "TabBarCoordinator.h"
#import "HomeCoordinator.h"
#import "MyVitaminsCoordinator.h"
#import "UIColor+Utils.h"

@interface TabBarCoordinator()

@property (nonatomic, strong) HomeCoordinator *homeCoordinator;
@property (nonatomic, strong) MyVitaminsCoordinator *myVitaminsCoordinator;
@property (nonatomic, strong) UITabBarController *tabBarController;

@end

@implementation TabBarCoordinator

@synthesize navController, storageManager;

- (instancetype)initWithNavigationController:(UINavigationController *)navController
                              storageManager:(StorageManager *)storageManager {
    self = [super init];
    if (self) {
        self.navController = navController;
        self.storageManager = storageManager;
    }
    return self;
}

- (void)start {
    self.tabBarController = [UITabBarController new];
    self.homeCoordinator = [[HomeCoordinator alloc] initWithNavigationController:self.navController storageManager:self.storageManager];
    self.myVitaminsCoordinator = [[MyVitaminsCoordinator alloc] initWithNavigationController:self.navController storageManager:self.storageManager];
    
    UIViewController *homeViewController = self.homeCoordinator.rootViewController;
    homeViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Home" image:[UIImage imageNamed:@"homeToolbarIcon"] tag:0];
    UIViewController *myVitaminsController = self.myVitaminsCoordinator.rootViewController;
    myVitaminsController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"My Vitamins" image:[UIImage imageNamed:@"pillToolbarIcon"] tag:1];
    self.tabBarController.delegate = self;
    self.tabBarController.tabBar.backgroundColor = UIColor.whiteColor;
    self.tabBarController.tabBar.tintColor = UIColor.purpleThemeColor;
    self.tabBarController.tabBar.translucent = NO;
    self.tabBarController.viewControllers = @[homeViewController, myVitaminsController];
    [self.navController showViewController:self.tabBarController sender:self];

    // Create random view controllers
    //    MainViewController *vc1 = [[MainViewController alloc] initWithNibName:MainViewController.identifier bundle:nil];
//    UIStoryboard *storyBoard = self.navController.storyboard;
//    MainViewController *vc1 = [storyBoard instantiateViewControllerWithIdentifier:MainViewController.identifier];
//
//    // TODO: create the proper Veiw controllers
//    //    UIViewController *vc1 = [UIViewController new];
//    vc1.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemRecents tag:0];
//
//    UIViewController *vc2 = [UIViewController new];
//    vc2.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:1];
//    MainTabBarController *controller = [[MainTabBarController alloc] initWithViewControllers:@[vc1, vc2] delegate:self];
//    [controller setTabViewControllers:@[vc1, vc2]];
//    [self.navController showViewController:controller sender:self];
}

- (NSArray *)coordinators {
    return @[self.homeCoordinator, self.myVitaminsCoordinator];
}

#pragma mark - TabBarControllerDelegate

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"View controller selected");
}


@end
