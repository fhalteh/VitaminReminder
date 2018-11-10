//
//  VitaminIntakeTableVC.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoVitaminsView.h"

@protocol VitaminIntakeTableVCDelegate

@end

@interface VitaminIntakeTableVC : UITableViewController <NoVitaminsViewDelegate>

@property NSDate *currentDate;

- (instancetype)initWithDelegate:(id <VitaminIntakeTableVCDelegate>)delegate
                         context:(NSManagedObjectContext *)context;

@end

