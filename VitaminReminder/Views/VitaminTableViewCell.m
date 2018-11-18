//
//  VitaminTableViewCell.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-07.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "VitaminTableViewCell.h"
#import "Vitamin.h"
#import "Dosage.h"
#import "NSDate+Utils.h"
#import "UIColor+Utils.h"

@interface VitaminTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *vitaminNameLabel;
@property (weak, nonatomic) IBOutlet UIStackView *dosageStackView;

@end

@implementation VitaminTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureCellWithVitamin:(Vitamin *)vitamin {
    self.vitaminNameLabel.text = vitamin.name;
    if (self.dosageStackView.arrangedSubviews.count != 0) {
        for (UIView *view in self.dosageStackView.arrangedSubviews) {
            [view removeFromSuperview];
        }
    }
    // TODO: if it's one dosage then we should show pill and not pills
//    for (Dosage *dosage in vitamin.dosage) {
//        UILabel *label = [UILabel new];
//        NSNumber *pills = dosage.numberOfPills;
//        NSString *time = dosage.reminderTime.inHoursAndMinutes;
//        label.text = [NSString stringWithFormat:@"%@ pills at %@", pills, time];
//        label.font = [UIFont fontWithName:@"Proxima Nova Light" size:17.0];
//        label.textColor = UIColor.textGrayColor;
//        [self.dosageStackView addArrangedSubview:label];
//    }
}

+ (NSString *)reuseIdentifier {
    return @"VitaminTableViewCellReuseIdentifier";
}

+ (NSString *)nibName {
    return @"VitaminTableViewCell";
}


@end
