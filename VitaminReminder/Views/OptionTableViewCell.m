//
//  OptionTableViewCell.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-20.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "OptionTableViewCell.h"
#import "OptionCellViewModel.h"

@interface OptionTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@end

@implementation OptionTableViewCell

- (void)configureCellWithViewModel:(OptionCellViewModel *)viewModel {
    self.titleLabel.text = viewModel.title;
    self.valueLabel.text = viewModel.value;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
