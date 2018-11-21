//
//  TabBarCoordinator.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coordinator.h"
#import "MyVitaminsCoordinator.h"

@interface TabBarCoordinator : NSObject <Coordinator, UITabBarControllerDelegate, MyVitaminsCoordinatorDelegate>

- (instancetype)initWithNavigationController:(UINavigationController *)navController
                              storageManager:(StorageManager *)storageManager;

@end
