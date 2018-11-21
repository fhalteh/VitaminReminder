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

// TODO: delete
//- (void)registerNibForCollectionView:(UICollectionView *)collectionView {
//    UINib *nib = [UINib nibWithNibName:DosageCollectionViewCell.nibName bundle:nil] ;
//    NSString *reuseIdentifier = DosageCollectionViewCell.reuseIdentifier;
//    [collectionView registerNib:nib
//     forCellWithReuseIdentifier:reuseIdentifier];
//}

//- (void)registerNibForTableView:(UITableView *)tableView {
//    for (CellViewModel *cellViewModel in self.cellViewModels) {
//        UINib *nib = [UINib nibWithNibName:cellViewModel.nibName bundle:nil] ;
//        NSString *reuseIdentifier = cellViewModel.reuseIdentifier;
//        [tableView registerNib:nib forCellReuseIdentifier:reuseIdentifier];
//    }
//}

// TODO:
- (UICollectionViewCell *)dequeueAndConfigureCellInCollectionView:(UICollectionView *)collectionView
                                                      atIndexPath:(NSIndexPath *)indexPath
                                                           target:(id)target {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DosageCollectionViewCell.reuseIdentifier forIndexPath:indexPath];
    DosageCollectionViewCell *dosageCell = (DosageCollectionViewCell *)cell;
    if (indexPath.row == self.cellViewModels.count) {
        [dosageCell configureCellWithAddIcon];
    } else {
        // TODO: empty array?
        DosageViewModel *viewModel = self.cellViewModels[indexPath.item];
        // TODO: add the index path here, should be the target and implement the
        [dosageCell configureWithViewModel:viewModel
                                    target:target
                                 indexPath:indexPath];
//        [dosageCell configureWithViewModel:viewModel];
    }
    return dosageCell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    DosageCollectionViewCell *cell = [[NSBundle mainBundle] loadNibNamed:DosageCollectionViewCell.nibName owner:self options:nil].firstObject;
//    if (indexPath.row < self.dosages.count) {
//        DosageViewModel *viewModel = self.cellViewModels[indexPath.row];
//        [cell configureWithViewModel:viewModel];
//    } else {
//        [cell configureCellWithAddIcon];
//    }
//    [cell setNeedsLayout];
//    [cell layoutIfNeeded];
//    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return CGSizeMake(85, 95);
}

// TODO: Remove
- (void)removeDosageCellViewModelAtIndex:(NSInteger)index {
    // TODO: test addi
//    DosageViewModel *model = [[DosageViewModel alloc] init];
//    model.timeText = @"hi";
//    model.pillsText = @"2 pills";
//
//    [self.cellViewModels addObject:model];
    if (index >= 0 && index < self.cellViewModels.count) {
        [self.cellViewModels removeObjectAtIndex:index];
    }
}

// TODO: is this being used
- (void)addDosageCellViewModelWithDataModel:(DosageDataModel *)dosageDataModel {
    DosageViewModel *dosageViewModel = [self createDosageViewModel:dosageDataModel];
    [self.cellViewModels addObject:dosageViewModel];
}

// TODO: Add a method to return updated dosages

// TODO: get the view model at this point?

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
