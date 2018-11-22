//
//  TabBarCoordinator.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "TabBarCoordinator.h"
#import "HomeCoordinator.h"
#import "UIColor+Utils.h"
#import "AddOrEditVitaminCoordinator.h"

@interface TabBarCoordinator()

@property (nonatomic, strong) HomeCoordinator *homeCoordinator;
@property (nonatomic, strong) MyVitaminsCoordinator *myVitaminsCoordinator;
@property (nonatomic, strong) UITabBarController *tabBarController;
@property (nonatomic, strong) AddOrEditVitaminCoordinator *addOrEditVitaminCoordinator;

@end

@implementation TabBarCoordinator

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
    self.tabBarController = [UITabBarController new];
    self.homeCoordinator = [[HomeCoordinator alloc] initWithRootViewController:self.rootViewController storageManager:self.storageManager];
    self.myVitaminsCoordinator = [[MyVitaminsCoordinator alloc] initWithDelegate:self rootViewController:rootViewController storageManager:storageManager];
    
    UIViewController *homeViewController = self.homeCoordinator.rootViewController;
    homeViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Home" image:[UIImage imageNamed:@"homeToolbarIcon"] tag:0];
    UIViewController *myVitaminsController = self.myVitaminsCoordinator.rootViewController;
    myVitaminsController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"My Vitamins" image:[UIImage imageNamed:@"pillToolbarIcon"] tag:1];
    self.tabBarController.delegate = self;
    self.tabBarController.tabBar.backgroundColor = UIColor.whiteColor;
    self.tabBarController.tabBar.tintColor = UIColor.purpleThemeColor;
    self.tabBarController.tabBar.translucent = NO;
    self.tabBarController.viewControllers = @[homeViewController, myVitaminsController];
    [self.rootViewController showViewController:self.tabBarController sender:self];
}

- (NSArray *)coordinators {
    return @[self.homeCoordinator, self.myVitaminsCoordinator];
}

#pragma mark - MyVitaminsCoordinatorDelegate

- (void)onAddVitaminButtonClicked {
    self.addOrEditVitaminCoordinator = [[AddOrEditVitaminCoordinator alloc] initWithRootViewController:self.tabBarController storageManager:self.storageManager];
    [self.addOrEditVitaminCoordinator start];
}

- (void)didSelectVitamin:(VitaminDataModel *)vitaminDataModel {
    self.addOrEditVitaminCoordinator = [[AddOrEditVitaminCoordinator alloc] initWithRootViewController:self.tabBarController storageManager:self.storageManager];
    self.addOrEditVitaminCoordinator.vitaminDataModel = vitaminDataModel;
    [self.addOrEditVitaminCoordinator start];
}

@end
