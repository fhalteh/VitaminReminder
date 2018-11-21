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

// TODO: pass the delegate
- (void)configureWithViewModel:(DosagesCellViewModel *)viewModel delegate:(id <DosagesTableViewCellDelegate>)delegate {
    self.viewModel = viewModel;
    self.titleLabel.text = viewModel.title;
    self.delegate = delegate;
    [self.collectionView reloadData];
    // pass the delegate here?
    // TODO: shouldn't we keep the view model?
//    [self.viewModel registerNibForCollectionView:self.collectionView];
}

//- (void)setViewModel:(DosagesCellViewModel *)viewModel {
//    _viewModel = viewModel;
//    [self.collectionView reloadData];
//    NSLog(@"will reload the collection view");
//}

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
    NSLog(@"Number of items: %@", @(self.viewModel.numberOfCells));
    NSInteger count = self.viewModel.numberOfCells;
    if (count == 0) {
        EmptyDataView *view = [[EmptyDataView alloc] initWithFrame:self.collectionView.frame
                                                             title:@"🙌🏻"
                                                              text:@"No dosages added"];
        self.collectionView.backgroundView = view;
    } else {
        self.collectionView.backgroundView = nil;
    }
    // if it's 0 then add a view
    
    return self.viewModel.numberOfCells;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self.viewModel dequeueAndConfigureCellInCollectionView:collectionView
                                                       atIndexPath:indexPath
                                                            target:self];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    //
    return CGSizeMake(70, 80);
//    return [self.viewModel collectionView:collectionView
//                   sizeForItemAtIndexPath:indexPath];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsZero;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    // Add selected?
    if (indexPath.row == [collectionView numberOfItemsInSection:0] - 1) {
        if (self.delegate) {
            [self.delegate onAddDosageClicked];
        }
    }
    NSLog(@"Selected item");
}

- (void)onDeleteDosageClicked:(UIButton *)sender {
    NSLog(@"Delete button clicked with tag: %@", @(sender.tag));
    // TODO: delete the dosages and update the collection view
    
    // Tell the delegate about the removal of htis?
    // Tell the view model that it's been removed
    // TODO: tell the delegate
    [self.viewModel removeDosageCellViewModelAtIndex:sender.tag];
    [self.collectionView reloadData];

    // TODO: inform the d
//    [self.delegate onRemoveDosageClickedWithIndex:sender.tag];
    
    // TODO: Remove this?
//    [self.collectionView reloadData];
//    [self.collectionView performBatchUpdates:^{
//        [self.collectionView layoutIfNeeded];
//    } completion:^(BOOL finished) {
//        [self.collectionView reloadData];
//        [self layoutIfNeeded];
//    }];
//    collectionView.performBatchUpdates({
//        collectionView.layoutIfNeeded()
//    }) { (completed) in
//        self.collectionView.reloadData()
//        self.layoutIfNeeded()
//    }

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
