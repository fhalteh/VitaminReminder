//
//  MainViewController.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VitaminIntakeTableVC.h"

@interface MainViewController : UIViewController <VitaminIntakeTableVCDelegate>

@property NSManagedObjectContext *managedObjectContext;

+ (NSString *)identifier;

@end

