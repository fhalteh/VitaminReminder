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

@interface DosageViewModel: NSObject

@property (nonatomic, strong) NSString *pillsText;
@property (nonatomic, strong) NSString *timeText;
@property (nonatomic, strong) DosageDataModel *dosageDataModel;

@end

@interface DosagesCellViewModel : CellViewModel

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSMutableArray <DosageViewModel *> *cellViewModels;


- (instancetype)initWithDosages:(NSArray <DosageDataModel *> *)dosages;
- (CGSize)collectionView:(UICollectionView *)collectionView
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
- (UICollectionViewCell *)dequeueAndConfigureCellInCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath target:(id)target;
- (NSInteger)numberOfCells;
- (void)removeDosageCellViewModelAtIndex:(NSInteger)index;
- (void)addDosageCellViewModelWithDataModel:(DosageDataModel *)dosageDataModel;

@end

