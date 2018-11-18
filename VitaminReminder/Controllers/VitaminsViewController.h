//
//  VitaminsViewController.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-07.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllVitaminsTableVC.h"

@class StorageManager;

@interface VitaminsViewController : UIViewController <AllVitaminsTableVCDelegate>

// init with store instead!
//- (instancetype)initWithContext:(NSManagedObjectContext *)context;

- (instancetype)initWithStorageManager:(StorageManager *)storageManager;

@end
