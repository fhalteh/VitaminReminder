//
//  DosagesTableViewCell.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-20.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "DosagesTableViewCell.h"
#import "DosagesCellViewModel.h"
#import "DosageCollectionViewCell.h"

@interface DosagesTableViewCell()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) DosagesCellViewModel *viewModel;

@end

@implementation DosagesTableViewCell

- (void)configureWithViewModel:(DosagesCellViewModel *)viewModel {
    self.viewModel = viewModel;
    self.titleLabel.text = viewModel.title;
//    [self.viewModel registerNibForCollectionView:self.collectionView];
}

- (void)awakeFromNib {
    // TODO: check if this will get called bfore?
    [super awakeFromNib];
    UINib *nib = [UINib nibWithNibName:DosageCollectionViewCell.nibName bundle:nil] ;
    NSString *reuseIdentifier = DosageCollectionViewCell.reuseIdentifier;
    [self.collectionView registerNib:nib
     forCellWithReuseIdentifier:reuseIdentifier];
//    [self.viewModel registerNibForCollectionView:self.collectionView];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *) self.collectionView.collectionViewLayout;
    flowLayout.estimatedItemSize = CGSizeMake(1, 1);
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.viewModel.numberOfCells;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self.viewModel dequeueAndConfigureCellInCollectionView:collectionView
                                                       atIndexPath:indexPath];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self.viewModel collectionView:collectionView
                   sizeForItemAtIndexPath:indexPath];
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    DosageCollectionViewCell *cell = [[NSBundle mainBundle] loadNibNamed:DosageCollectionViewCell.nibName owner:self options:nil].firstObject;
//    if (indexPath.row < self.dosages.count) {
//        Dosage *dosage = self.dosages[indexPath.row];
//        //        [cell configureCellWithDosage:dosage];
//    } else {
//        [cell configureCellWithAddIcon];
//    }
//    [cell setNeedsLayout];
//    [cell layoutIfNeeded];
//    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
//    return CGSizeMake(size.width, 95);
//}

@end
