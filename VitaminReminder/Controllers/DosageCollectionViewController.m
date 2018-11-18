//
//  DosageCollectionViewController.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-07.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "DosageCollectionViewController.h"
#import "DosageCollectionViewCell.h"
#import "Dosage.h"

// drop this class?
@interface DosageCollectionViewController ()

@property (nonatomic, weak) id <DosageCollectionViewControllerDelegate> delegate;

@end

// TODO: should be changed to use an MVVVM pattern
@implementation DosageCollectionViewController

- (instancetype)initWithDelegate:(id<DosageCollectionViewControllerDelegate>)delegate
                         dosages:(NSArray *)dosages {
    self = [super initWithNibName:@"DosageCollectionViewController" bundle:nil];
    if (self) {
        self.delegate = delegate;
        self.dosages = dosages;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerNib];
}

- (void)registerNib {
    UINib *nib = [UINib nibWithNibName:DosageCollectionViewCell.nibName bundle:nil] ;
    NSString *reuseIdentifier = DosageCollectionViewCell.reuseIdentifier;
    [self.collectionView registerNib:nib
          forCellWithReuseIdentifier:reuseIdentifier];
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *) self.collectionView.collectionViewLayout;
    flowLayout.estimatedItemSize = CGSizeMake(1, 1);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.collectionView reloadData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dosages.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // Check if the index path is on the last one?
    // TODO: should do it in a smarter way
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DosageCollectionViewCell.reuseIdentifier forIndexPath:indexPath];
    DosageCollectionViewCell *dosageCell = (DosageCollectionViewCell *)cell;
    if (indexPath.row == self.dosages.count) {
        [dosageCell configureCellWithAddIcon];
    } else {
        Dosage *dosage = self.dosages[indexPath.row];
        [dosageCell configureCellWithDosage:dosage];
    }
    return dosageCell;
}

#pragma mark <UICollectionViewDelegate>

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    DosageCollectionViewCell *cell = [[NSBundle mainBundle] loadNibNamed:DosageCollectionViewCell.nibName owner:self options:nil].firstObject;
    if (indexPath.row < self.dosages.count) {
        Dosage *dosage = self.dosages[indexPath.row];
        [cell configureCellWithDosage:dosage];
    } else {
        [cell configureCellWithAddIcon];
    }
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return CGSizeMake(size.width, 95);
}

@end
