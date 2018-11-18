//
//  AppCoordinator.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "MainTabBarController.h"
#import "Coordinator.h"
#import <CoreData/CoreData.h>
#import "WelcomeViewController.h"

@interface AppCoordinator : NSObject <Coordinator, WelcomeViewControllerDelegate>

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController
                                   container:(NSPersistentContainer *)container;
//- (instancetype)initWithNavigationController:(UINavigationController *)navigationController;
//- (void)start;

@end
