//
//  TextEntryCellViewModel.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-20.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "TextEntryCellViewModel.h"

@implementation TextEntryCellViewModel

- (CellViewModelType)type {
    return CellViewModelTypeTextEntry;
}

- (NSString *)nibName {
    return @"TextEntryTableViewCell";
}

- (NSString *)reuseIdentifier {
    return @"TextEntryTableViewCellReuseIdentifier";
}

#pragma mark - UITextFieldDelegate

- (void)textFieldEditingDidChange:(UITextField *)textField {
    self.value = textField.text;
}

@end
