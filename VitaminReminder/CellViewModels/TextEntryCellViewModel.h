//
//  TextEntryCellViewModel.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-20.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "CellViewModel.h"
#import <UIKit/UIKit.h>

@interface TextEntryCellViewModel : CellViewModel

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) NSString *value;

- (void)textFieldEditingDidChange:(UITextField *)textField;

@end
