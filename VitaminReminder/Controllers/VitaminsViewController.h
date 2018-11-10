//
//  VitaminsViewController.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-07.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllVitaminsTableVC.h"

@interface VitaminsViewController : UIViewController <AllVitaminsTableVCDelegate>

- (instancetype)initWithContext:(NSManagedObjectContext *)context;

@end
