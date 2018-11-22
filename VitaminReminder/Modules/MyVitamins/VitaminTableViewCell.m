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

@end

@implementation VitaminTableViewCell

- (void)configureCellWithVitamin:(Vitamin *)vitamin {
    self.vitaminNameLabel.text = vitamin.name;
}

+ (NSString *)reuseIdentifier {
    return @"VitaminTableViewCellReuseIdentifier";
}

+ (NSString *)nibName {
    return @"VitaminTableViewCell";
}


@end
