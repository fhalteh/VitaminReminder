//
//  VitaminSchedulerViewController.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-20.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VitaminSchedulerViewControllerDelegate

- (void)onVitaminSchedulerCancelClicked;
// TODO: change the vitamin name to details
- (void)onFrequencyClicked;
- (void)onVitaminSchedulerNextClickedWithVitaminName:(NSString *)vitaminName;

@end

@interface VitaminSchedulerViewController : UITableViewController

- (instancetype)initWithDelegate:(id <VitaminSchedulerViewControllerDelegate>)delegate                     vitaminName:(NSString *)vitaminName;

@end
