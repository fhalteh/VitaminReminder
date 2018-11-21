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
#import "DosagesTableViewCell.h"

@interface VitaminSchedulerViewModel()

@property (nonatomic, strong) DosagesCellViewModel *dosagesCellViewModel;
@property (nonatomic, strong) OptionCellViewModel *optionCellViewModel;
@property (nonatomic, strong) NSArray <CellViewModel *> *cellViewModels;

@end

@implementation VitaminSchedulerViewModel

- (instancetype)initWithVitaminDataModel:(VitaminDataModel *)vitaminDataModel {
    self = [super init];
    if (self) {
        self.vitaminDataModel = vitaminDataModel;
        [self createCellViewModels];
    }
    return self;
}

- (void)registerNibForTableView:(UITableView *)tableView {
    [self registerNibForTableView:tableView cellViewModel:self.dosagesCellViewModel];
    [self registerNibForTableView:tableView cellViewModel:self.optionCellViewModel];
}

- (void)registerNibForTableView:(UITableView *)tableView cellViewModel:(CellViewModel *)cellViewModel {
    UINib *nib = [UINib nibWithNibName:cellViewModel.nibName bundle:nil] ;
    NSString *reuseIdentifier = cellViewModel.reuseIdentifier;
    [tableView registerNib:nib forCellReuseIdentifier:reuseIdentifier];
}

// TODO: should be created with the pre exisitng data if we're editing
- (void)createCellViewModels {
    // Options
    self.optionCellViewModel = [[OptionCellViewModel alloc] init];
    self.optionCellViewModel.title = @"Frequency";
    if (self.vitaminDataModel.days) {
        if (self.vitaminDataModel.days.isEverydaySelected) {
            self.optionCellViewModel.value = @"Everyday";
        } else {
            self.optionCellViewModel.value = self.vitaminDataModel.days.daysString;
        }
    } else {
        self.optionCellViewModel.value = @"None";
    }

    // Dosages
    DosageDataModel *dosage = [[DosageDataModel alloc] init];
    dosage.numberOfPills = 2;
    dosage.time = NSDate.date;

    self.dosagesCellViewModel = [[DosagesCellViewModel alloc] initWithDosages:@[dosage]];
    self.dosagesCellViewModel.title = @"Dosages";
    
//    // TODO: fake dosages remove
//    self.dosagesCellViewModel.dosages = @[dosage];
////    self.dosagesCellViewModel.dosages = self.vitaminDataModel.dosages;

    self.cellViewModels = @[self.optionCellViewModel, self.dosagesCellViewModel];
}

- (NSInteger)numberOfSections {
    return self.cellViewModels.count;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)dequeueAndConfigureCellInTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath {
    CellViewModel *cellViewModel = [self.cellViewModels objectAtIndex:indexPath.section];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellViewModel.reuseIdentifier forIndexPath:indexPath];
    if (cellViewModel.type == CellViewModelTypeOption) {
        OptionTableViewCell *optionCell = (OptionTableViewCell *)cell;
        [optionCell configureCellWithViewModel:self.optionCellViewModel];
    } else if (cellViewModel.type == CellViewModelTypeDosages) {
        DosagesTableViewCell *dosagesCell = (DosagesTableViewCell *)cell;
        [dosagesCell configureWithViewModel:self.dosagesCellViewModel];
    }
    return cell;
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
