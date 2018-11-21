//
//  OptionCellViewModel.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-20.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "OptionCellViewModel.h"

@implementation OptionCellViewModel

- (NSString *)value {
    if (self.daysDataModel) {
        if (self.daysDataModel.isEverydaySelected) {
            return @"Everyday";
        } else {
            return self.daysDataModel.daysString;
        }
    }
    return @"None";
}

- (CellViewModelType)type {
    return CellViewModelTypeOption;
}

- (NSString *)nibName {
    return @"OptionTableViewCell";
}

- (NSString *)reuseIdentifier {
    return @"OptionTableViewCellReuseIdentifier";
}

@end
