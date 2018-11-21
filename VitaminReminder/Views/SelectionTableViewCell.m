//
//  SelectionTableViewCell.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-21.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "SelectionTableViewCell.h"

@interface SelectionTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *checkmarkImage;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;


@end

@implementation SelectionTableViewCell

- (void)configureWithViewModel:(SelectionCellViewModel *)viewModel {
    self.valueLabel.text = viewModel.title;
    NSLog(@"View model title: %@", viewModel.title);
    self.checkmarkImage.hidden = !viewModel.selected;
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
