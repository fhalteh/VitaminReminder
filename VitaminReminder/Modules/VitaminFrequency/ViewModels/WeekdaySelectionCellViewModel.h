//
//  SelectionCellViewModel.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-21.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "CellViewModel.h"
#import "DaysDataModel.h"

@interface WeekdaySelectionCellViewModel : CellViewModel

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) BOOL selected;
@property (nonatomic, assign) Weekday weekday;

@end
