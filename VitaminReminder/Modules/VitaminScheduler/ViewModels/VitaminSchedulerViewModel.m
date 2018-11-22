//
//  VitaminSchedulerViewModel.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-20.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "VitaminSchedulerViewModel.h"
#import "CellViewModel.h"
#import "DosagesCellViewModel.h"
#import "OptionCellViewModel.h"
#import "OptionTableViewCell.h"
#import "VitaminSchedulerViewModel.h"

@interface VitaminSchedulerViewModel()

@property (nonatomic, strong) DosagesCellViewModel *dosagesCellViewModel;
@property (nonatomic, strong) OptionCellViewModel *optionCellViewModel;
@property (nonatomic, strong) NSArray <CellViewModel *> *cellViewModels;

@property (nonatomic, strong) VitaminDataModel *initialVitaminDataModel;

@end

@implementation VitaminSchedulerViewModel

- (instancetype)initWithVitaminDataModel:(VitaminDataModel *)vitaminDataModel {
    self = [super init];
    if (self) {
//        self.vitaminDataModel = vitaminDataModel;
        self.initialVitaminDataModel = vitaminDataModel;
        [self createCellViewModelsWithVitaminDataModel:vitaminDataModel];
//        self.vitaminName = vitaminDataModel.name;
    }
    return self;
}

- (void)registerNibForTableView:(UITableView *)tableView {
    [self registerNibForTableView:tableView cellViewModel:self.dosagesCellViewModel];
    [self registerNibForTableView:tableView cellViewModel:self.optionCellViewModel];
//    [self registerNibForTableView:tableView cellViewModel:self.buttonCellViewModel];
}

- (void)registerNibForTableView:(UITableView *)tableView cellViewModel:(CellViewModel *)cellViewModel {
    UINib *nib = [UINib nibWithNibName:cellViewModel.nibName bundle:nil] ;
    NSString *reuseIdentifier = cellViewModel.reuseIdentifier;
    [tableView registerNib:nib forCellReuseIdentifier:reuseIdentifier];
}

- (void)createCellViewModelsWithVitaminDataModel:(VitaminDataModel *)vitaminDataModel {
    self.optionCellViewModel = [[OptionCellViewModel alloc] init];
    self.optionCellViewModel.title = @"Frequency";
    self.optionCellViewModel.daysDataModel = vitaminDataModel.days;
    self.dosagesCellViewModel = [[DosagesCellViewModel alloc] initWithDosages:vitaminDataModel.dosages];
    self.dosagesCellViewModel.title = @"Dosages";
    self.cellViewModels = @[self.optionCellViewModel, self.dosagesCellViewModel];
}

- (NSInteger)numberOfSections {
    return self.cellViewModels.count;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CellViewModel *)cellViewModelAtIndexPath:(NSIndexPath *)indexPath {
    return (indexPath.section == 0) ? self.optionCellViewModel : self.dosagesCellViewModel;
}

- (UITableViewCell *)dequeueAndConfigureCellInTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath delegate:(id <DosagesTableViewCellDelegate>)delegate {    
    CellViewModel *cellViewModel = [self cellViewModelAtIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellViewModel.reuseIdentifier forIndexPath:indexPath];
    if (cellViewModel.type == CellViewModelTypeOption) {
        OptionTableViewCell *optionCell = (OptionTableViewCell *)cell;
        [optionCell configureCellWithViewModel:self.optionCellViewModel];
    } else if (cellViewModel.type == CellViewModelTypeDosages) {
        DosagesTableViewCell *dosagesCell = (DosagesTableViewCell *)cell;
        [dosagesCell configureWithViewModel:self.dosagesCellViewModel
                                   delegate:delegate];
    }
    return cell;
}

- (void)updateDaysDataModel:(DaysDataModel *)daysDataModel {
    self.optionCellViewModel.daysDataModel = daysDataModel;
}

- (DaysDataModel *)daysDataModel {
    return self.optionCellViewModel.daysDataModel;
}

- (void)removeDosageAtIndex:(NSInteger)index {
    [self.dosagesCellViewModel removeDosageCellViewModelAtIndex:index];
}

- (void)addDosageDataModel:(DosageDataModel *)dosageDataModel {
    [self.dosagesCellViewModel addDosageCellViewModelWithDataModel:dosageDataModel];
}

- (BOOL)validate {
    if (self.dosagesCellViewModel.cellViewModels.count == 0) {
        return NO;
    }
    if (self.optionCellViewModel.daysDataModel.noneSelected) {
        return NO;
    }
    return YES;
}

- (VitaminSchedulerViewControllerError)errorType {
    if (self.dosagesCellViewModel.cellViewModels.count == 0) {
        return VitaminSchedulerViewControllerErrorDosagesUndefined;
    }
    if (self.optionCellViewModel.daysDataModel.noneSelected) {
        return VitaminSchedulerViewControllerErrorFrequencyUndefined;
    }
    return VitaminSchedulerViewControllerErrorDefault;
}

- (VitaminDataModel *)updatedVitaminDataModel {
    VitaminDataModel *updatedVitaminDataModel = self.initialVitaminDataModel;
    updatedVitaminDataModel.days = self.optionCellViewModel.daysDataModel;
    NSMutableArray <DosageDataModel *> *dosages = [NSMutableArray new];
    for (DosageViewModel *dosageViewModel in self.dosagesCellViewModel.cellViewModels) {
        [dosages addObject:dosageViewModel.dosageDataModel];
    }
    updatedVitaminDataModel.dosages = dosages;
    return updatedVitaminDataModel;
}

@end
