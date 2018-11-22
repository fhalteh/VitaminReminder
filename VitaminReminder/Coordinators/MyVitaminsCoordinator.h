//
//  MyVitaminsCoordinator.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coordinator.h"
#import "MyVitaminsTableViewController.h"

@protocol MyVitaminsCoordinatorDelegate

- (void)onAddVitaminButtonClicked;
- (void)didSelectVitamin:(VitaminDataModel *)vitaminDataModel;

@end

@interface MyVitaminsCoordinator : NSObject <Coordinator, MyVitaminsTableViewControllerDelegate>

- (instancetype)initWithDelegate:(id <MyVitaminsCoordinatorDelegate>)delegate
              rootViewController:(UIViewController *)viewController
                  storageManager:(StorageManager *)storageManager;

@end
