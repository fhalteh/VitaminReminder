//
//  OptionCellViewModel.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-20.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "CellViewModel.h"
#import "VitaminSchedulerViewModel.h"

@interface OptionCellViewModel : CellViewModel

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) DaysDataModel *daysDataModel;

@end
