//
//  VitaminFrequencyViewModel.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-21.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DaysDataModel.h"
#import <UIKit/UIKit.h>

@interface VitaminFrequencyViewModel : NSObject

@property (nonatomic, strong) DaysDataModel *daysDataModel;

- (void)registerNibForTableView:(UITableView *)tableView;
- (UITableViewCell *)dequeueAndConfigureCellInTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)numberOfRows;

@end
