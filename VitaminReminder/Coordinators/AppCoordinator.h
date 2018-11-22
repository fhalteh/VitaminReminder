//
//  AppCoordinator.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coordinator.h"
#import <CoreData/CoreData.h>
#import "WelcomeViewController.h"

@interface AppCoordinator : NSObject <Coordinator, WelcomeViewControllerDelegate>

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
                                   container:(NSPersistentContainer *)container;

@end
