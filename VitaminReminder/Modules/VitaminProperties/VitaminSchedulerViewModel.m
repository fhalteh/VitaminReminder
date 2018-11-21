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
#import "ButtonCellViewModel.h"
#import "VitaminSchedulerViewModel.h"
#import "ButtonTableViewCell.h"

@interface VitaminSchedulerViewModel()

@property (nonatomic, strong) DosagesCellViewModel *dosagesCellViewModel;
@property (nonatomic, strong) OptionCellViewModel *optionCellViewModel;
@property (nonatomic, strong) NSArray <CellViewModel *> *cellViewModels;
//@property (nonatomic, strong) NSString *vitaminName;

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

// TODO: should be created with the pre exisitng data if we're editing
- (void)createCellViewModelsWithVitaminDataModel:(VitaminDataModel *)vitaminDataModel {
    // Options
    self.optionCellViewModel = [[OptionCellViewModel alloc] init];
    self.optionCellViewModel.title = @"Frequency";
    self.optionCellViewModel.daysDataModel = vitaminDataModel.days;
    // option cell value will need to hold this data?
    
//    if (vitaminDataModel.days) {
//        if (self.vitaminDataModel.days.isEverydaySelected) {
//            self.optionCellViewModel.value = @"Everyday";
//        } else {
//            self.optionCellViewModel.value = self.vitaminDataModel.days.daysString;
//        }
//    } else {
//        self.optionCellViewModel.value = @"None";
//    }

    // TODO: remvoe example data
    // Dosages
//    DosageDataModel *dosage = [[DosageDataModel alloc] init];
//    dosage.numberOfPills = 2;
//    dosage.time = NSDate.date;
//    self.vitaminDataModel.dosages = [NSMutableArray array];
//    [self.vitaminDataModel.dosages addObject:dosage];
//

    // TODO: pass the real dosages
    self.dosagesCellViewModel = [[DosagesCellViewModel alloc] initWithDosages:vitaminDataModel.dosages];
    self.dosagesCellViewModel.title = @"Dosages";
    
//    self.buttonCellViewModel = [[ButtonCellViewModel alloc] init];
//    self.buttonCellViewModel.title = @"Add dosage";
//
//    // TODO: fake dosages remove
//    self.dosagesCellViewModel.dosages = @[dosage];
////    self.dosagesCellViewModel.dosages = self.vitaminDataModel.dosages;

//    self.cellViewModels = @[self.optionCellViewModel, self.dosagesCellViewModel, self.buttonCellViewModel];
    self.cellViewModels = @[self.optionCellViewModel, self.dosagesCellViewModel];

}

- (NSInteger)numberOfSections {
    return self.cellViewModels.count;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return 1;
    // if it's section 1 -> two rows
//    if (section == 0) {
//        return 1;
//    } else if (section == 1) {
//        return 2;
//    }
//    return 0;
}

- (CellViewModel *)cellViewModelAtIndexPath:(NSIndexPath *)indexPath {
    return (indexPath.section == 0) ? self.optionCellViewModel : self.dosagesCellViewModel;
//    if (indexPath.section == 0) {
//        return self.optionCellViewModel;
//    }
//    if (indexPath.row == 0) {
//        return self.dosagesCellViewModel;
//    }
//    return self.buttonCellViewModel;
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
//    else if (cellViewModel.type == CellViewModelTypeButton) {
//        ButtonTableViewCell *buttonCell = (ButtonTableViewCell *)cell;
//        [buttonCell configureWithViewModel:self.buttonCellViewModel];
//    }
    return cell;
}

- (void)updateDaysDataModel:(DaysDataModel *)daysDataModel {
    // TODO: don't manipulate with the vitamin data model?
    self.optionCellViewModel.daysDataModel = daysDataModel;
    // TODO: don't
    // Most recent updates
//    self.vitaminDataModel.days = daysDataModel;
//    [self createCellViewModels];
}

- (DaysDataModel *)daysDataModel {
    return self.optionCellViewModel.daysDataModel;
}

// TODO: utilize
- (void)removeDosageAtIndex:(NSInteger)index {
    
    // Remove ti from the dosage
    
    [self.dosagesCellViewModel removeDosageCellViewModelAtIndex:index];
    // We should not change anything with the actual vitmain data model data!
//    if (index >= 0 && index < self.vitaminDataModel.dosages.count) {
//        [self.vitaminDataModel.dosages removeObjectAtIndex:index];
//    }
//    [self createCellViewModels];
    
    // Test by resettin
//    self.dosagesCellViewModel.dosages = @[];
//    self.vitaminDataModel.dosages = NSMutableArray.array;
//    self.
}

- (void)addDosageDataModel:(DosageDataModel *)dosageDataModel {
//    DosageViewModel *dosageViewModel = [[DosageViewModel alloc] init];
//    dosageViewModel.timeText = dosageDataModel.time.
    [self.dosagesCellViewModel addDosageCellViewModelWithDataModel:dosageDataModel];
    //
//    [self.dosagesCellViewModel.cellViewModels addObject:dosageViewModel];
    
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
    // TODO: generate the vitamin data model!
    // TODO: generate it
    
    VitaminDataModel *updatedVitaminDataModel = self.initialVitaminDataModel;
    updatedVitaminDataModel.days = self.optionCellViewModel.daysDataModel;
    NSMutableArray <DosageDataModel *> *dosages = [NSMutableArray new];
    for (DosageViewModel *dosageViewModel in self.dosagesCellViewModel.cellViewModels) {
        [dosages addObject:dosageViewModel.dosageDataModel];
    }
    updatedVitaminDataModel.dosages = dosages;
    return updatedVitaminDataModel;
//    updatedVitaminDataModel.dosages self.dosagesCellViewModel.cellViewModels
    
}


//- (NSString *)vitaminName {
//    //
////    return self.textEntryViewModel.value;
//}
//
//- (BOOL)validateVitaminProperties {
////    return self.textEntryViewModel.value && self.textEntryViewModel.value.length > 3;
//}

@end
