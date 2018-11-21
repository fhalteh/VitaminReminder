//
//  MyVitaminsCoordinator.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "MyVitaminsCoordinator.h"
#import "AllVitaminsTableVC.h"
//#import "AddOrEditVitaminCoordinator.h"

@interface MyVitaminsCoordinator()

// TODO: add as property or not?
//@property (nonatomic, strong) AddOrEditVitaminCoordinator *addOrEditVitaminCoordinator;
@property (nonatomic, weak) id <MyVitaminsCoordinatorDelegate> delegate;

@end

@implementation MyVitaminsCoordinator

@synthesize navController, storageManager, rootViewController;

- (instancetype)initWithDelegate:(id <MyVitaminsCoordinatorDelegate>)delegate
            navigationController:(UINavigationController *)navigationController
                  storageManager:(StorageManager *)storageManager {
    self = [super init];
    if (self) {
        self.delegate = delegate;
        self.navController = navigationController;
        self.storageManager = storageManager;
    }
    return self;
}

- (UIViewController *)rootViewController {
    // init with the storage manager
    // TODO: change from context to store manager
    AllVitaminsTableVC *viewController = [[AllVitaminsTableVC alloc] initWithDelegate:self storageManager:self.storageManager];
    
//    VitaminsViewController *viewController = [[VitaminsViewController alloc] initWithDelegate:self
//                                                                               storageManager:self.storageManager];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    // TODO: should be the delegate of vitamins view ocntroller
    return navigationController;
//    return [[VitaminsViewController alloc] init];
}

#pragma mark - MyVitaminsViewControllerDelegate

- (void)onAddVitaminButtonClicked {
    BOOL isFirstResponder = self.navController.isFirstResponder;
    [self.delegate onAddVitaminButtonClicked];
    NSLog(@"is first responder: %@", isFirstResponder ? @"YES" : @"NO");
    // TODO: not opening the view controller? WHY?
//    self.addOrEditVitaminCoordinator = [[AddOrEditVitaminCoordinator alloc] initWithNavigationController:self.rootViewController storageManager:self.storageManager];
//    [self.addOrEditVitaminCoordinator start];
    // TODO: should use the vitamins coordinator to show it?
//    self.addOrEditVitaminCoordinator = [AddOrEditVitaminCoordinator alloc] init
    
}

@end
