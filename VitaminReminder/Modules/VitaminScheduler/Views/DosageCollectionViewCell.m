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
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

@end

@implementation DosageCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.dosageBackgroundView addCornerRadiusAndShadow];
    [self.deleteButton addShadowWithoutOffset];
}

- (void)configureWithViewModel:(DosageViewModel *)viewModel
                        target:(id)target
                     indexPath:(NSIndexPath *)indexPath {
    self.numberOfPillsLabel.text = viewModel.pillsText;
    self.timeLabel.text = viewModel.timeText;
    self.addIcon.hidden = YES;
    self.deleteButton.hidden = NO;
    self.deleteButton.tag = indexPath.row;
    #pragma GCC diagnostic ignored "-Wundeclared-selector"
    [self.deleteButton addTarget:target
                          action:@selector(onDeleteDosageClicked:)
                forControlEvents:UIControlEventTouchUpInside];
    self.timeLabel.hidden = NO;
    self.numberOfPillsLabel.hidden = NO;
}

- (void)configureCellWithAddIcon {
    self.numberOfPillsLabel.hidden = YES;
    self.timeLabel.hidden = YES;
    self.addIcon.hidden = NO;
    self.deleteButton.hidden = YES;
}

+ (NSString *)reuseIdentifier {
    return @"DosageCollectionViewCellReuseIdentifier";
}

+ (NSString *)nibName {
    return @"DosageCollectionViewCell";
}

@end
