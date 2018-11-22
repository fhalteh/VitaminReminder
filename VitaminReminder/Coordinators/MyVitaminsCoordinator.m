//
//  MyVitaminsCoordinator.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "MyVitaminsCoordinator.h"
#import "MyVitaminsTableViewController.h"

@interface MyVitaminsCoordinator()

@property (nonatomic, weak) id <MyVitaminsCoordinatorDelegate> delegate;

@end

@implementation MyVitaminsCoordinator

@synthesize storageManager, rootViewController;

- (instancetype)initWithDelegate:(id <MyVitaminsCoordinatorDelegate>)delegate
              rootViewController:(UIViewController *)rootViewController
                  storageManager:(StorageManager *)storageManager {
    self = [super init];
    if (self) {
        self.delegate = delegate;
        self.rootViewController = rootViewController;
        self.storageManager = storageManager;
    }
    return self;
}

- (UIViewController *)rootViewController {
    MyVitaminsTableViewController *viewController = [[MyVitaminsTableViewController alloc] initWithDelegate:self storageManager:self.storageManager];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    return navigationController;
}

#pragma mark - MyVitaminsViewControllerDelegate

- (void)didSelectVitamin:(VitaminDataModel *)vitaminDataModel {
    [self.delegate didSelectVitamin:vitaminDataModel];
}

- (void)onAddVitaminButtonClicked {
    [self.delegate onAddVitaminButtonClicked];
}

@end
