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
//#import "DosageViewController.h"

@protocol VitaminSchedulerViewControllerDelegate

- (void)onVitaminSchedulerCancelClicked;
// TODO: change the vitamin name to details
//- (void)onFrequencyClicked;// TODO: is this being called?

- (void)onVitaminSchedulerNextClickedWithVitaminDataModel:(VitaminDataModel *)vitaminDataModel;
// TODO: change this
//- (void)onVitaminSchedulerNextClickedWithVitaminName:(NSString *)vitaminName;

//- (void)onAddDosageClicked; // TO

@end

// TODO: the delegate to frequency can be moved to the coordinator
@interface VitaminSchedulerViewController : UITableViewController <FrequencyTableViewControllerDelegate, DosagesTableViewCellDelegate, DosageViewControllerDelegate>

- (instancetype)initWithDelegate:(id <VitaminSchedulerViewControllerDelegate>)delegate
                vitaminDataModel:(VitaminDataModel *)vitaminDataModel;

@end
