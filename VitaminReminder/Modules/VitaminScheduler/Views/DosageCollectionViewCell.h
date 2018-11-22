//
//  DosageCollectionViewCell.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-07.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Dosage, DosageViewModel;

@interface DosageCollectionViewCell : UICollectionViewCell

- (void)configureCellWithAddIcon;
- (void)configureWithViewModel:(DosageViewModel *)viewModel
                        target:(id)target
                     indexPath:(NSIndexPath *)indexPath;


+ (NSString *)reuseIdentifier;
+ (NSString *)nibName;

@end
