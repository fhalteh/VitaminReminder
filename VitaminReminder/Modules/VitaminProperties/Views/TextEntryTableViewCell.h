//
//  TextEntryTableViewCell.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-19.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextEntryCellViewModel.h"

@interface TextEntryTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *valueTextField;

- (void)configureWithViewModel:(TextEntryCellViewModel *)viewModel delegate:(id <UITextFieldDelegate>)delegate;


@end
