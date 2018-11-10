//
//  VitaminIntakeTableViewCell.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VitaminIntakeCellModel.h"

@interface VitaminIntakeTableViewCell : UITableViewCell

- (void)configureCellWithModel:(VitaminIntakeCellModel *)model;

+ (CGFloat)height;
+ (NSString *)reuseIdentifier;
+ (NSString *)nibName;

@end
