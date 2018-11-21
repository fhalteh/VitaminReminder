//
//  VitaminPropertiesViewModel.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-20.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class VitaminDataModel;

@interface VitaminPropertiesViewModel : NSObject

- (instancetype)initWithVitaminDataModel:(VitaminDataModel *)vitaminDataModel;

- (void)registerNibForTableView:(UITableView *)tableView;
- (NSInteger)numberOfSections;
- (NSInteger)numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)dequeueAndConfigureCellInTableView:(UITableView *)tableView
                                            atIndexPath:(NSIndexPath *)indexPath
                                               delegate:(id <UITextFieldDelegate>)delegate;
- (NSString *)vitaminName;
- (BOOL)validateVitaminProperties;
- (VitaminDataModel *)updatedVitaminDataModel;
- (BOOL)isEditingVitamin;

@end
