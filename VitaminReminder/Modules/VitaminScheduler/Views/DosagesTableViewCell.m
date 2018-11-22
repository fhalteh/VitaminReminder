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
#import "EmptyDataView.h"

@interface DosagesTableViewCell()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) DosagesCellViewModel *viewModel;
@property (nonatomic, weak) id <DosagesTableViewCellDelegate> delegate;

@end

@implementation DosagesTableViewCell

- (void)configureWithViewModel:(DosagesCellViewModel *)viewModel delegate:(id <DosagesTableViewCellDelegate>)delegate {
    self.viewModel = viewModel;
    self.titleLabel.text = viewModel.title;
    self.delegate = delegate;
    [self.collectionView reloadData];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    UINib *nib = [UINib nibWithNibName:DosageCollectionViewCell.nibName bundle:nil] ;
    NSString *reuseIdentifier = DosageCollectionViewCell.reuseIdentifier;
    [self.collectionView registerNib:nib
     forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *) self.collectionView.collectionViewLayout;
    flowLayout.estimatedItemSize = CGSizeMake(1, 1);
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.viewModel.numberOfCells;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self.viewModel dequeueAndConfigureCellInCollectionView:collectionView
                                                       atIndexPath:indexPath
                                                            target:self];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(70, 80);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsZero;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == [collectionView numberOfItemsInSection:0] - 1) {
        if (self.delegate) {
            [self.delegate onAddDosageClicked];
        }
    }
}

- (void)onDeleteDosageClicked:(UIButton *)sender {
    [self.viewModel removeDosageCellViewModelAtIndex:sender.tag];
    [self.collectionView reloadData];
}

@end
