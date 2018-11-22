//
//  VitaminSchedulerViewModel.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-20.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DosageDataModel.h"
#import "DaysDataModel.h"
#import <UIKit/UIKit.h>
#import "DosagesTableViewCell.h"
#import "VitaminDataModel.h"
#import "VitaminSchedulerViewController.h"

typedef enum : NSUInteger {
    VitaminIntakeFrequencyEveryday,
    VitaminIntakeFrequencySomeDays,
} VitaminIntakeFrequency;

@class CellViewModel;

@interface VitaminSchedulerViewModel : NSObject

- (instancetype)initWithVitaminDataModel:(VitaminDataModel *)vitaminDataModel;
- (NSInteger)numberOfRowsInSection:(NSInteger)section;
- (NSInteger)numberOfSections;
- (void)registerNibForTableView:(UITableView *)tableView;
- (UITableViewCell *)dequeueAndConfigureCellInTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath delegate:(id <DosagesTableViewCellDelegate>)delegate;
- (void)updateDaysDataModel:(DaysDataModel *)daysDataModel;
- (void)removeDosageAtIndex:(NSInteger)index;
- (void)addDosageDataModel:(DosageDataModel *)dosageDataModel;
- (DaysDataModel *)daysDataModel;
- (BOOL)validate;
- (VitaminSchedulerViewControllerError)errorType;
- (VitaminDataModel *)updatedVitaminDataModel;

@end
