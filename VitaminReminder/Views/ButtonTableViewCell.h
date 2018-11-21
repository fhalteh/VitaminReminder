//
//  ButtonTableViewCell.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-21.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>

// TODO: Delete class
@class ButtonCellViewModel;

@interface ButtonTableViewCell : UITableViewCell

- (void)configureWithViewModel:(ButtonCellViewModel *)viewModel;

//+ (NSString *)reuseIdentifier;
//+ (NSString *)nibName;

@end
