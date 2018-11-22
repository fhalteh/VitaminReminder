//
//  OptionTableViewCell.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-20.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OptionCellViewModel.h"

@interface OptionTableViewCell : UITableViewCell

- (void)configureCellWithViewModel:(OptionCellViewModel *)viewModel;

@end
