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

@implementation DosagesCellViewModel

- (instancetype)initWithDosages:(NSArray <DosageDataModel *> *)dosages {
    self = [super init];
    if (self) {
        self.dosages = dosages;
        [self createViewModels];
    }
    return self;
}

- (void)createViewModels {
    NSMutableArray *cellViewModels = [NSMutableArray new];
    for (DosageDataModel *dosage in self.dosages) {
        DosageViewModel *viewModel = [DosageViewModel new];
        viewModel.timeText = dosage.time.inHoursAndMinutes;
        NSString *pillsText = @"pill";
        if (dosage.numberOfPills > 1) {
            pillsText = [pillsText stringByAppendingString:@"s"];
        }
        viewModel.pillsText = [NSString stringWithFormat:@"%d %@", dosage.numberOfPills, pillsText];
        [cellViewModels addObject:viewModel];
    }
    self.cellViewModels = cellViewModels;
}

- (NSInteger)numberOfCells {
    return self.dosages.count + 1;
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
- (UICollectionViewCell *)dequeueAndConfigureCellInCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DosageCollectionViewCell.reuseIdentifier forIndexPath:indexPath];
    DosageCollectionViewCell *dosageCell = (DosageCollectionViewCell *)cell;
    if (indexPath.row == self.dosages.count) {
        [dosageCell configureCellWithAddIcon];
    } else {
        // TODO: empty array?
        DosageViewModel *viewModel = self.cellViewModels[indexPath.item];
        [dosageCell configureWithViewModel:viewModel];
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
    return CGSizeMake(80, 95);
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
