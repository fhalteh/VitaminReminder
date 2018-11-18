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

@interface AppCoordinator()

@property (nonatomic) UINavigationController *navController;

@end

@implementation AppCoordinator

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController {
    self = [super init];
    if (self) {
        self.navController = navigationController;
    }
    return self;
}

- (void)start {
    // Create random view controllers
//    MainViewController *vc1 = [[MainViewController alloc] initWithNibName:MainViewController.identifier bundle:nil];
    UIStoryboard *storyBoard = self.navController.storyboard;
    MainViewController *vc1 = [storyBoard instantiateViewControllerWithIdentifier:MainViewController.identifier];

    // TODO: create the proper Veiw controllers
//    UIViewController *vc1 = [UIViewController new];
    vc1.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemRecents tag:0];
    
    UIViewController *vc2 = [UIViewController new];
    vc2.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:1];
    MainTabBarController *controller = [[MainTabBarController alloc] initWithViewControllers:@[vc1, vc2] delegate:self];
    [controller setTabViewControllers:@[vc1, vc2]];
    [self.navController showViewController:controller sender:self];
}

@end
