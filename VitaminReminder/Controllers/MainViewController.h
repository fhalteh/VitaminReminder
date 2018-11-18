//
//  MainViewController.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VitaminIntakeTableVC.h"
#import "CustomNavigationBar.h"

@class StorageManager;

@interface MainViewController : UIViewController <VitaminIntakeTableVCDelegate, CustomNavigationBarDelegate>

// TODO: instead of the managed object context, use the store?
//@property NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) StorageManager *storageManager;

+ (NSString *)identifier;

@end

