//
//  VitaminIntakeTableViewCell.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "VitaminIntakeTableViewCell.h"
#import "UIView+Utils.h"

@interface VitaminIntakeTableViewCell()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UILabel *vitaminNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *checkmarkImage;

@end

@implementation VitaminIntakeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.containerView addCornerRadiusAndShadow];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)configureCellWithModel:(VitaminIntakeCellModel *)model {
    self.vitaminNameLabel.text = model.vitaminName;
    self.timeLabel.text = model.time;
    self.checkmarkImage.hidden = !model.taken;
}

+ (CGFloat)height {
    return 120.0;
}

+ (NSString *)reuseIdentifier {
    return @"VitaminIntakeTableViewCellReuseIdentifier";
}

+ (NSString *)nibName {
    return @"VitaminIntakeTableViewCell";
}

@end
