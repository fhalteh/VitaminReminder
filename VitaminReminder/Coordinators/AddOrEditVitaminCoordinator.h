//
//  AddOrEditVitaminCoordinator.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-19.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coordinator.h"
#import "VitaminPropertiesViewController.h"
#import "VitaminSchedulerViewController.h"
#import "VitaminSaverViewController.h"

@interface AddOrEditVitaminCoordinator : NSObject <Coordinator, VitaminPropertiesViewControllerDelegate, VitaminSchedulerViewControllerDelegate, VitaminSaverViewControllerDelegate>

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController
                              storageManager:(StorageManager *)storageManager;

@end
