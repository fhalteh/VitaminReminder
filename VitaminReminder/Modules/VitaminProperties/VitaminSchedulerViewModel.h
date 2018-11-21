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
#import "VitaminDataModel.h"

typedef enum : NSUInteger {
    VitaminIntakeFrequencyEveryday,
    VitaminIntakeFrequencySomeDays,
} VitaminIntakeFrequency;

@class CellViewModel;

@interface VitaminSchedulerViewModel : NSObject

@property (nonatomic, strong) VitaminDataModel *vitaminDataModel;

// TODO: should be utilized

// should just have the vitamin data model instead?
//@property (nonatomic, strong) NSString *vitaminName;
//@property (nonatomic, assign) VitaminIntakeFrequency frequency;
//@property (nonatomic, strong) DaysDataModel *daysDataModel;
//@property (nonatomic, strong) NSArray <DosageDataModel *> *dosages;

- (instancetype)initWithVitaminDataModel:(VitaminDataModel *)vitaminDataModel;
- (NSInteger)numberOfRowsInSection:(NSInteger)section;
- (NSInteger)numberOfSections;
- (void)registerNibForTableView:(UITableView *)tableView;
- (UITableViewCell *)dequeueAndConfigureCellInTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath;

@end
