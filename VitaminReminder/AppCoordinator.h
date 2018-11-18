//
//  AppCoordinator.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainTabBarController.h"

@interface AppCoordinator : NSObject <MainTabBarControllerDelegate>

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController;
- (void)start;

@end
