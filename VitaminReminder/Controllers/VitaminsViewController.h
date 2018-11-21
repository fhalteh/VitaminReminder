//
//  VitaminsViewController.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-07.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllVitaminsTableVC.h"

@protocol MyVitaminsViewControllerDelegate

- (void)onAddVitaminButtonClicked;

@end

@class StorageManager;
// TODO: delete file not needed anymore
// rename to my vitamins view controller
@interface VitaminsViewController : UIViewController <MyVitaminsViewControllerDelegate>

- (instancetype)initWithDelegate:(id <MyVitaminsViewControllerDelegate>)delegate
                  storageManager:(StorageManager *)storageManager;

@end
