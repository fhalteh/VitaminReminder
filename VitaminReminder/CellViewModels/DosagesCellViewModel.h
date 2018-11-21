//
//  DosagesCellViewModel.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-20.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "CellViewModel.h"
#import <UIKit/UIKit.h>
#import "DosageDataModel.h"
// TODO: this is going to help the dosages view controller
// data source of the dosages?

@interface DosageViewModel: NSObject

//@property (nonatomic, strong) DosageDataModel *dosage;
@property (nonatomic, strong) NSString *pillsText;
@property (nonatomic, strong) NSString *timeText;

@end

@interface DosagesCellViewModel : CellViewModel

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray <DosageDataModel *> *dosages;
@property (nonatomic, strong) NSArray <DosageViewModel *> *cellViewModels;

- (instancetype)initWithDosages:(NSArray <DosageDataModel *> *)dosages;
//- (void)registerNibForCollectionView:(UICollectionView *)collectionView;
- (CGSize)collectionView:(UICollectionView *)collectionView
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
- (UICollectionViewCell *)dequeueAndConfigureCellInCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)numberOfCells;
@end

