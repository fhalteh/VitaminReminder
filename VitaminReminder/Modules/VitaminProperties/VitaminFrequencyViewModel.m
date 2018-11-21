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
        if (!daysDataModel) {
            daysDataModel = [[DaysDataModel alloc] init];
        }
//        self.daysDataModel = daysDataModel;
        [self createCellViewModelsWithDaysDataModel:daysDataModel];
    }
    return self;
}

- (void)createCellViewModelsWithDaysDataModel:(DaysDataModel *)daysDataModel {
    NSMutableArray *cellViewModels = [NSMutableArray new];
    NSArray *days = @[@(WeekdaySunday), @(WeekdayMonday), @(WeekdayTuesday), @(WeekdayWednesday), @(WeekdayThursday), @(WeekdayFriday), @(WeekdaySaturday)];
    for (NSNumber *day in days) {
        SelectionCellViewModel *cellViewModel = [self createSelectionCellViewModelWithWeekday:day.intValue daysDataModel:daysDataModel];
        [cellViewModels addObject:cellViewModel];
    }
    self.cellViewModels = cellViewModels;
    
//
//    SelectionCellViewModel *mondayViewModel = [self createSelectionCellViewModelTitle:@"Monday" selected:self.daysDataModel.monday];
//    [cellViewModels addObject:mondayViewModel];
//    SelectionCellViewModel *tuesdayViewModel = [self createSelectionCellViewModelTitle:@"Tuesday" selected:self.daysDataModel.tuesday];
//    [cellViewModels addObject:tuesdayViewModel];
//    SelectionCellViewModel *wednesdayViewModel = [self createSelectionCellViewModelTitle:@"Wednesday" selected:self.daysDataModel.wednesday];
//    [cellViewModels addObject:wednesdayViewModel];
//    SelectionCellViewModel *thursdayViewModel = [self createSelectionCellViewModelTitle:@"Thursday" selected:self.daysDataModel.thursday];
//    [cellViewModels addObject:thursdayViewModel];
//    SelectionCellViewModel *fridayViewModel = [self createSelectionCellViewModelTitle:@"Friday" selected:self.daysDataModel.friday];
//    [cellViewModels addObject:fridayViewModel];
//    SelectionCellViewModel *saturdayViewModel = [self createSelectionCellViewModelTitle:@"Saturday" selected:self.daysDataModel.saturday];
//    [cellViewModels addObject:saturdayViewModel];
//    SelectionCellViewModel *sundayViewModel = [self createSelectionCellViewModelTitle:@"Sunday" selected:self.daysDataModel.sunday];
//    [cellViewModels addObject:sundayViewModel];
//    self.cellViewModels = cellViewModels;
}

//- (SelectionCellViewModel *)createSelectionCellViewModelTitle:(NSString *)title
//                                                     selected:(BOOL)selected {
//    SelectionCellViewModel *cellViewModel = [[SelectionCellViewModel alloc] init];
//    cellViewModel.title = title;
//    cellViewModel.selected = selected;
//    return cellViewModel;
//}

- (SelectionCellViewModel *)createSelectionCellViewModelWithWeekday:(Weekday)weekday daysDataModel:(DaysDataModel *)daysDataModel {
    SelectionCellViewModel *cellViewModel = [[SelectionCellViewModel alloc] init];
    cellViewModel.title = [DaysDataModel getTitle:weekday];
    cellViewModel.selected = [daysDataModel isWeekdaySelected:weekday];
    cellViewModel.weekday = weekday;
    return cellViewModel;
}

- (void)registerNibForTableView:(UITableView *)tableView {
    SelectionCellViewModel *selectionCellViewModel = self.cellViewModels.firstObject;
    UINib *nib = [UINib nibWithNibName:selectionCellViewModel.nibName bundle:nil] ;
    NSString *reuseIdentifier = selectionCellViewModel.reuseIdentifier;
    [tableView registerNib:nib forCellReuseIdentifier:reuseIdentifier];
}

- (UITableViewCell *)dequeueAndConfigureCellInTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath {
    SelectionCellViewModel *selectionCellViewModel = [self.cellViewModels objectAtIndex:indexPath.row];
    SelectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:selectionCellViewModel.reuseIdentifier forIndexPath:indexPath];
    [cell configureWithViewModel:selectionCellViewModel];
    return cell;
}

- (SelectionCellViewModel *)cellViewModelAtIndexPath:(NSIndexPath *)indexPath {
    SelectionCellViewModel *cellViewModel = [self.cellViewModels objectAtIndex:indexPath.row];
    return cellViewModel;
}

- (NSInteger)numberOfRows {
    return self.cellViewModels.count;
}

// TODO: Create a NEW days data model
// WHAT?
- (DaysDataModel *)updatedDaysDataModel {
    DaysDataModel *updatedDaysDataModel = [DaysDataModel new];
    for (SelectionCellViewModel *cellViewModel in self.cellViewModels) {
        BOOL selected = cellViewModel.selected;
        Weekday weekday = cellViewModel.weekday;
        [updatedDaysDataModel updateWeekday:weekday selected:selected];
    }
    
    return updatedDaysDataModel;
}

- (void)selectAll {
    for (SelectionCellViewModel *cellViewModel in self.cellViewModels) {
        cellViewModel.selected = YES;
    }
}

// no need to keep it updated!
//- (void)updateWeekday:(Weekday)weekday selected:(BOOL)selected {
//    [self.daysDataModel updateWeekday:weekday selected:selected];
//}

@end
