//
//  MyVitaminsCoordinator.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coordinator.h"
#import "VitaminsViewController.h"
#import "AllVitaminsTableVC.h"

@protocol MyVitaminsCoordinatorDelegate

- (void)onAddVitaminButtonClicked;

@end

@interface MyVitaminsCoordinator : NSObject <Coordinator, MyVitaminsViewControllerDelegate>

// TODO: should rethink this through, maybe it should be moved to the coordinator protocol
- (instancetype)initWithDelegate:(id <MyVitaminsCoordinatorDelegate>)delegate
            navigationController:(UINavigationController *)navigationController
                  storageManager:(StorageManager *)storageManager;

@end
