//
//  TextEntryTableViewCell.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-19.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "TextEntryTableViewCell.h"

@interface TextEntryTableViewCell()


@end

@implementation TextEntryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureWithViewModel:(TextEntryCellViewModel *)viewModel {
    self.titleLabel.text = viewModel.title;
    self.valueTextField.text = viewModel.value;
    self.valueTextField.placeholder = viewModel.placeholder;
    [self.valueTextField addTarget:viewModel action:@selector(textFieldEditingDidChange:) forControlEvents:UIControlEventEditingChanged];
}

+ (NSString *)reuseIdentifier {
    return @"TextEntryTableViewCellReuseIdentifier";
}

+ (NSString *)nibName {
    return @"TextEntryTableViewCell";
}

@end
