//
//  ColorSelectorTableViewCell.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-19.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "ColorSelectorTableViewCell.h"
#import "ColoredCircleView.h"

@interface ColorSelectorTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIStackView *colorsStackView;

@end

@implementation ColorSelectorTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // setup the views
    ColoredCircleView *view = [[ColoredCircleView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    view.color = UIColor.yellowColor;
    [self.colorsStackView addArrangedSubview:view];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureWithViewModel:(ColorSelectorCellViewModel *)viewModel {
    self.titleLabel.text = viewModel.title;
    
    // Setup the
    // Set the selected color 
}

@end
