//
//  DosageCollectionViewCell.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-07.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Dosage;

@interface DosageCollectionViewCell : UICollectionViewCell

- (void)configureCellWithDosage:(Dosage *)dosage;
- (void)configureCellWithAddIcon;

+ (NSString *)reuseIdentifier;
+ (NSString *)nibName;

@end
