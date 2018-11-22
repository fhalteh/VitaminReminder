//
//  FrequencyTableViewController.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-21.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VitaminFrequencyViewModel, DaysDataModel;

@protocol FrequencyTableViewControllerDelegate <NSObject>

- (void)onFrequencyUpdatedWithDaysDataModel:(DaysDataModel *)daysDataModel;

@end

@interface FrequencyTableViewController : UITableViewController

- (instancetype)initWithDelegate:(id <FrequencyTableViewControllerDelegate>)delegate
                       viewModel:(VitaminFrequencyViewModel *)viewModel;

@end
