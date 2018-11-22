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

- (void)configureWithViewModel:(WeekdaySelectionCellViewModel *)viewModel {
    self.valueLabel.text = viewModel.title;
    self.checkmarkImage.hidden = !viewModel.selected;
}

@end
