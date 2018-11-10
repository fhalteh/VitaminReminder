//
//  VitaminTableViewCell.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-07.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Vitamin;

@interface VitaminTableViewCell : UITableViewCell

- (void)configureCellWithVitamin:(Vitamin *)vitamin;

+ (NSString *)reuseIdentifier;
+ (NSString *)nibName;

@end
