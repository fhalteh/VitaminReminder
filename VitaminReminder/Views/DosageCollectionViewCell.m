//
//  DosageCollectionViewCell.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-07.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "DosageCollectionViewCell.h"
#import "NSDate+Utils.h"
#import "Dosage.h"
#import "UIView+Utils.h"

@interface DosageCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIView *dosageBackgroundView;
@property (weak, nonatomic) IBOutlet UILabel *numberOfPillsLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


@end

@implementation DosageCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.dosageBackgroundView addCornerRadiusAndShadow];
}

- (void)configureCellWithDosage:(Dosage *)dosage {
    self.numberOfPillsLabel.text = [NSString stringWithFormat:@"%@", dosage.numberOfPills];
    self.timeLabel.text = dosage.reminderTime.inHoursAndMinutes;
}

+ (NSString *)reuseIdentifier {
    return @"DosageCollectionViewCellReuseIdentifier";
}

+ (NSString *)nibName {
    return @"DosageCollectionViewCell";
}

@end
