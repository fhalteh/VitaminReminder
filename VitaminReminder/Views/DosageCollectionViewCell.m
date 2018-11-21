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

// TODO: pass the target and the index path here
- (void)configureWithViewModel:(DosageViewModel *)viewModel
                        target:(id)target
                     indexPath:(NSIndexPath *)indexPath {
    NSLog(@"configure with view model called: %@", viewModel.pillsText);
    NSLog(@"configure with view model called: %@", viewModel.timeText);
    NSLog(@"configure with view model called: %@", viewModel.dosageDataModel);

    self.numberOfPillsLabel.text = viewModel.pillsText;
    self.timeLabel.text = viewModel.timeText;
    self.addIcon.hidden = YES;
    self.deleteButton.hidden = NO;
    // set the tag of the button as the index
    self.deleteButton.tag = indexPath.row;
    
    // TODO: pass the target here
    [self.deleteButton addTarget:target
                          action:@selector(onDeleteDosageClicked:)
                forControlEvents:UIControlEventTouchUpInside];
    // Add a delete button
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
