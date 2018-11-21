//
//  DosagesTableViewCell.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-20.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DosagesTableViewCell.h"
#import "DosagesCellViewModel.h"

@protocol DosagesTableViewCellDelegate

- (void)onAddDosageClicked;
- (void)onRemoveDosageClickedWithIndex:(NSInteger)index;

@end

@interface DosagesTableViewCell : UITableViewCell <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

- (void)configureWithViewModel:(DosagesCellViewModel *)viewModel delegate:(id <DosagesTableViewCellDelegate>)delegate;

@end
