//
//  VitaminSchedulerViewController.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-20.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FrequencyTableViewController.h"
#import "DosagesTableViewCell.h"
#import "DosageViewController.h"

typedef enum : NSUInteger {
    VitaminSchedulerViewControllerErrorFrequencyUndefined,
    VitaminSchedulerViewControllerErrorDosagesUndefined,
    VitaminSchedulerViewControllerErrorDefault,
} VitaminSchedulerViewControllerError;

@class VitaminDataModel;

@protocol VitaminSchedulerViewControllerDelegate

- (void)onVitaminSchedulerCancelClicked;
- (void)onVitaminSchedulerNextClickedWithVitaminDataModel:(VitaminDataModel *)vitaminDataModel;

@end

@interface VitaminSchedulerViewController : UITableViewController <FrequencyTableViewControllerDelegate, DosagesTableViewCellDelegate, DosageViewControllerDelegate>

- (instancetype)initWithDelegate:(id <VitaminSchedulerViewControllerDelegate>)delegate
                vitaminDataModel:(VitaminDataModel *)vitaminDataModel;

@end
