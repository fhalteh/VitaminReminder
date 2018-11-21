//
//  ColorSelectorCellViewModel.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-20.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "ColorSelectorCellViewModel.h"

@implementation ColorSelectorCellViewModel

- (CellViewModelType)type {
    return CellViewModelTypeColorSelection;
}

- (NSString *)nibName {
    return @"ColorSelectorTableViewCell";
}

- (NSString *)reuseIdentifier {
    return @"ColorSelectorTableViewCellReuseIdentifier";
}

@end
