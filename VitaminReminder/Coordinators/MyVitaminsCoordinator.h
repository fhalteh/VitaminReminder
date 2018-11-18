//
//  MyVitaminsCoordinator.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coordinator.h"

@interface MyVitaminsCoordinator : NSObject <Coordinator>

// TODO: should rethink this through, maybe it should be moved to the coordinator protocol
- (instancetype)initWithNavigationController:(UINavigationController *)navController
                              storageManager:(StorageManager *)storageManager;

@end
