//
//  VitaminFrequencyViewModel.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-21.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "VitaminFrequencyViewModel.h"
#import "SelectionCellViewModel.h"
#import "SelectionTableViewCell.h"

@interface VitaminFrequencyViewModel()

@property (nonatomic, strong) NSArray <SelectionCellViewModel *> *cellViewModels;

@end

@implementation VitaminFrequencyViewModel

- (instancetype)initWithDaysDataModel:(DaysDataModel *)daysDataModel {
    self = [super init];
    if (self) {
        self.daysDataModel = daysDataModel;
        [self createCellViewModels];
    }
    return self;
}

- (void)createCellViewModels {
    NSMutableArray *cellViewModels = [NSMutableArray new];
    SelectionCellViewModel *mondayViewModel = [self createSelectionCellViewModelTitle:@"Monday" selected:self.daysDataModel.monday];
    [cellViewModels addObject:mondayViewModel];
    SelectionCellViewModel *tuesdayViewModel = [self createSelectionCellViewModelTitle:@"Tuesday" selected:self.daysDataModel.tuesday];
    [cellViewModels addObject:tuesdayViewModel];
    SelectionCellViewModel *wednesdayViewModel = [self createSelectionCellViewModelTitle:@"Wednesday" selected:self.daysDataModel.wednesday];
    [cellViewModels addObject:wednesdayViewModel];
    SelectionCellViewModel *thursdayViewModel = [self createSelectionCellViewModelTitle:@"Thursday" selected:self.daysDataModel.thursday];
    [cellViewModels addObject:thursdayViewModel];
    SelectionCellViewModel *fridayViewModel = [self createSelectionCellViewModelTitle:@"Friday" selected:self.daysDataModel.friday];
    [cellViewModels addObject:fridayViewModel];
    SelectionCellViewModel *saturdayViewModel = [self createSelectionCellViewModelTitle:@"Saturday" selected:self.daysDataModel.saturday];
    [cellViewModels addObject:saturdayViewModel];
    SelectionCellViewModel *sundayViewModel = [self createSelectionCellViewModelTitle:@"Sunday" selected:self.daysDataModel.sunday];
    [cellViewModels addObject:sundayViewModel];
    self.cellViewModels = cellViewModels;
}

- (SelectionCellViewModel *)createSelectionCellViewModelTitle:(NSString *)title
                                                     selected:(BOOL)selected {
    SelectionCellViewModel *cellViewModel = [[SelectionCellViewModel alloc] init];
    cellViewModel.title = title;
    cellViewModel.selected = selected;
    return cellViewModel;
}

- (void)registerNibForTableView:(UITableView *)tableView {
    SelectionCellViewModel *selectionCellViewModel = self.cellViewModels.firstObject;
    UINib *nib = [UINib nibWithNibName:selectionCellViewModel.nibName bundle:nil] ;
    NSString *reuseIdentifier = selectionCellViewModel.reuseIdentifier;
    [tableView registerNib:nib forCellReuseIdentifier:reuseIdentifier];
}

- (UITableViewCell *)dequeueAndConfigureCellInTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath {
    SelectionCellViewModel *selectionCellViewModel = [self.cellViewModels objectAtIndex:indexPath.section];
    SelectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:selectionCellViewModel.reuseIdentifier forIndexPath:indexPath];
    [cell configureWithViewModel:selectionCellViewModel];
    return cell;
}

- (NSInteger)numberOfRows {
    return 7;
}

@end
