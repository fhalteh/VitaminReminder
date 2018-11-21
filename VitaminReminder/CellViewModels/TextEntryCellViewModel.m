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

//- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    return YES;
//}
//
//- (void)textFieldDidBeginEditing:(UITextField *)textField {
//    NSLog(@"began editing");
//}
//
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    NSLog(@"text field should change");
//    return YES;
//}
//- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason {
//    NSLog(@"Text field did end editing");
//    // TODO: test if this method works
//    self.value = textField.text;
//}
//
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//
//}



@end
