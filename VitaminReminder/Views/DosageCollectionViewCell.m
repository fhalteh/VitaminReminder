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
#import "DosageDataModel.h"
#import "DosagesCellViewModel.h"

@interface DosageCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIView *dosageBackgroundView;
@property (weak, nonatomic) IBOutlet UILabel *numberOfPillsLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *addIcon;

@end

@implementation DosageCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.dosageBackgroundView addCornerRadiusAndShadow];
}

- (void)configureWithViewModel:(DosageViewModel *)viewModel {
    NSLog(@"configure with view model called: %@", viewModel.pillsText);

    self.numberOfPillsLabel.text = viewModel.pillsText;
    self.timeLabel.text = viewModel.timeText;
    self.addIcon.hidden = YES;
}

// TODO: remove
- (void)configureCellWithDosage:(Dosage *)dosage {
//    self.numberOfPillsLabel.text = [NSString stringWithFormat:@"%@", dosage.numberOfPills];
//    // TODO:
////    self.timeLabel.text = dosage.reminderTime.inHoursAndMinutes;
//    self.addIcon.hidden = YES;
}

- (void)configureCellWithAddIcon {
    self.numberOfPillsLabel.hidden = YES;
    self.timeLabel.hidden = YES;
    self.addIcon.hidden = NO;
}

+ (NSString *)reuseIdentifier {
    return @"DosageCollectionViewCellReuseIdentifier";
}

+ (NSString *)nibName {
    return @"DosageCollectionViewCell";
}

@end
