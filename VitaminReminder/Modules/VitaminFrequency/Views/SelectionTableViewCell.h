//
//  SelectionTableViewCell.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-21.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeekdaySelectionCellViewModel.h"

@interface SelectionTableViewCell : UITableViewCell

- (void)configureWithViewModel:(WeekdaySelectionCellViewModel *)viewModel;

@end
