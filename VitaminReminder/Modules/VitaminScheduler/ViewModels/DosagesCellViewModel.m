//
//  DosagesCellViewModel.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-20.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "DosagesCellViewModel.h"
#import "DosageCollectionViewCell.h"
#import "NSDate+Utils.h"
#import "DosageDataModel.h"

@implementation DosagesCellViewModel

- (instancetype)initWithDosages:(NSArray <DosageDataModel *> *)dosages {
    self = [super init];
    if (self) {
        [self createViewModelsWithDosages:dosages];
    }
    return self;
}

- (void)createViewModelsWithDosages:(NSArray <DosageDataModel *> *)dosages {
    NSMutableArray *cellViewModels = [NSMutableArray new];
    for (DosageDataModel *dosage in dosages) {
        DosageViewModel *viewModel = [self createDosageViewModel:dosage];
        [cellViewModels addObject:viewModel];
    }
    self.cellViewModels = cellViewModels;
}

- (DosageViewModel *)createDosageViewModel:(DosageDataModel *)dosageDataModel {
    DosageViewModel *viewModel = [DosageViewModel new];
    viewModel.dosageDataModel = dosageDataModel;
    viewModel.timeText = dosageDataModel.time.inHoursAndMinutes;
    NSString *pillsText = @"pill";
    if (dosageDataModel.numberOfPills > 1) {
        pillsText = [pillsText stringByAppendingString:@"s"];
    }
    viewModel.pillsText = [NSString stringWithFormat:@"%d %@", dosageDataModel.numberOfPills, pillsText];
    return viewModel;
}

- (NSInteger)numberOfCells {
    return self.cellViewModels.count + 1;
}

- (UICollectionViewCell *)dequeueAndConfigureCellInCollectionView:(UICollectionView *)collectionView
                                                      atIndexPath:(NSIndexPath *)indexPath
                                                           target:(id)target {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DosageCollectionViewCell.reuseIdentifier forIndexPath:indexPath];
    DosageCollectionViewCell *dosageCell = (DosageCollectionViewCell *)cell;
    if (indexPath.row == self.cellViewModels.count) {
        [dosageCell configureCellWithAddIcon];
    } else {
        DosageViewModel *viewModel = self.cellViewModels[indexPath.item];
        [dosageCell configureWithViewModel:viewModel
                                    target:target
                                 indexPath:indexPath];
    }
    return dosageCell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(85, 95);
}

- (void)removeDosageCellViewModelAtIndex:(NSInteger)index {
    if (index >= 0 && index < self.cellViewModels.count) {
        [self.cellViewModels removeObjectAtIndex:index];
    }
}

- (void)addDosageCellViewModelWithDataModel:(DosageDataModel *)dosageDataModel {
    DosageViewModel *dosageViewModel = [self createDosageViewModel:dosageDataModel];
    [self.cellViewModels addObject:dosageViewModel];
}

- (CellViewModelType)type {
    return CellViewModelTypeDosages;
}

- (NSString *)nibName {
    return @"DosagesTableViewCell";
}

- (NSString *)reuseIdentifier {
    return @"DosagesTableViewCellReuseIdentifier";
}

@end

@implementation DosageViewModel
@end
