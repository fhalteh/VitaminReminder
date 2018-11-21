//
//  VitaminPropertiesViewModel.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-20.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VitaminPropertiesViewModel : NSObject

- (void)registerNibForTableView:(UITableView *)tableView;
- (NSInteger)numberOfSections;
- (NSInteger)numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)dequeueAndConfigureCellInTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath;
- (NSString *)vitaminName;
- (BOOL)validateVitaminProperties;

@end
