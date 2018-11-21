//
//  OptionCellViewModel.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-20.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "OptionCellViewModel.h"

@implementation OptionCellViewModel

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
