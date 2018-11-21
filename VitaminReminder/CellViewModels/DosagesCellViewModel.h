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

// For each single dosage?
@interface DosageViewModel: NSObject

@property (nonatomic, strong) NSString *pillsText;
@property (nonatomic, strong) NSString *timeText;
@property (nonatomic, strong) DosageDataModel *dosageDataModel;

@end

@interface DosagesCellViewModel : CellViewModel

@property (nonatomic, strong) NSString *title;

// TODO: remove this
//@property (nonatomic, strong) NSArray <DosageDataModel *> *dosages; // TODO: REMOVE remove this?

// TODO: each dosage view model should have the dosage instead
@property (nonatomic, strong) NSMutableArray <DosageViewModel *> *cellViewModels;


- (instancetype)initWithDosages:(NSArray <DosageDataModel *> *)dosages;
//- (void)registerNibForCollectionView:(UICollectionView *)collectionView;
- (CGSize)collectionView:(UICollectionView *)collectionView
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
- (UICollectionViewCell *)dequeueAndConfigureCellInCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath target:(id)target;
- (NSInteger)numberOfCells;
- (void)removeDosageCellViewModelAtIndex:(NSInteger)index;

// TODO: how will we access this
- (void)addDosageCellViewModelWithDataModel:(DosageDataModel *)dosageDataModel;

@end

