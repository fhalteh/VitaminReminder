//
//  SelectionCellViewModel.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-21.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "WeekdaySelectionCellViewModel.h"

@implementation WeekdaySelectionCellViewModel

- (CellViewModelType)type {
    return CellViewModelTypeSelection;
}

- (NSString *)nibName {
    return @"SelectionTableViewCell";
}

- (NSString *)reuseIdentifier {
    return @"SelectionTableViewCellReuseIdentifier";
}

@end
