//
//  ColorSelectorTableViewCell.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-19.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorSelectorCellViewModel.h"

// TODO:
@interface ColorSelectorTableViewCell : UITableViewCell

- (void)configureWithViewModel:(ColorSelectorCellViewModel *)viewModel;

@end
