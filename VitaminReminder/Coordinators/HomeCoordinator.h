//
//  HomeCoordinator.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coordinator.h"

@interface HomeCoordinator : NSObject <Coordinator>

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
                              storageManager:(StorageManager *)storageManager;

@end
