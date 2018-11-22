//
//  VitaminSaverViewController.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-21.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VitaminDataModel, StorageManager;

@protocol VitaminSaverViewControllerDelegate

- (void)onVitaminSaverCompleted;

@end

@interface VitaminSaverViewController : UIViewController

- (instancetype)initWithVitaminDelegate:(id <VitaminSaverViewControllerDelegate>)delegate
                              dataModel:(VitaminDataModel *)vitaminDataModel
                         storageManager:(StorageManager *)storageManager;

@end
