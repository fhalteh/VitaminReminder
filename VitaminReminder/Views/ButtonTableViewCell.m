//
//  ButtonTableViewCell.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-21.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "ButtonTableViewCell.h"
#import "ButtonCellViewModel.h"

@interface ButtonTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *buttonTitle;


@end

@implementation ButtonTableViewCell


- (void)configureWithViewModel:(ButtonCellViewModel *)viewModel {
    self.buttonTitle.text = viewModel.title;
}

// TODO: remove these unneeded
//+ (NSString *)reuseIdentifier {
//    return @"ButtonTableViewCellReuseIdentifier";
//}
//
//+ (NSString *)nibName {
//    return @"ButtonTableViewCell";
//}

@end
