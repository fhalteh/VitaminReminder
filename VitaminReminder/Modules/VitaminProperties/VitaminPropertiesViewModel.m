//
//  VitaminPropertiesViewModel.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-20.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "VitaminPropertiesViewModel.h"
#import "CellViewModel.h"
#import "TextEntryCellViewModel.h"
#import "TextEntryTableViewCell.h"
#import "ColorSelectorCellViewModel.h"
#import "ColorSelectorTableViewCell.h"

@interface VitaminPropertiesViewModel()

@property (nonatomic, strong) TextEntryCellViewModel *textEntryViewModel;
// TODO: delete
@property (nonatomic, strong) NSMutableArray <CellViewModel *> *cellViewModels;

@end

@implementation VitaminPropertiesViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        [self createCellViewModels];
    }
    return self;
}

- (void)registerNibForTableView:(UITableView *)tableView {
    for (CellViewModel *cellViewModel in self.cellViewModels) {
        UINib *nib = [UINib nibWithNibName:cellViewModel.nibName bundle:nil] ;
        NSString *reuseIdentifier = cellViewModel.reuseIdentifier;
        [tableView registerNib:nib forCellReuseIdentifier:reuseIdentifier];
    }
}

- (void)createCellViewModels {
    self.cellViewModels = [NSMutableArray new];
    self.textEntryViewModel = [TextEntryCellViewModel new];
    self.textEntryViewModel.title = @"Name";
    self.textEntryViewModel.placeholder = @"Enter your vitamin name here!";
    // TODO: set the value
    [self.cellViewModels addObject:self.textEntryViewModel];

    // TODO: delete this? if it's not showing?
    ColorSelectorCellViewModel *colorSelectorViewModel = [ColorSelectorCellViewModel new];
    // TODO: set the value from the previous chosen color
    colorSelectorViewModel.color = AppearanceColorYellow;
    [self.cellViewModels addObject:colorSelectorViewModel];
    [self.cellViewModels addObject:colorSelectorViewModel];
}

- (NSInteger)numberOfSections {
    return 1;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return 2;
//    return self.cellViewModels.count;
}

- (UITableViewCell *)dequeueAndConfigureCellInTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath {
    // get reuse identifier at this index path

    CellViewModel *cellViewModel = [self.cellViewModels objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellViewModel.reuseIdentifier forIndexPath:indexPath];
    if (cellViewModel.type == CellViewModelTypeTextEntry) {
        TextEntryTableViewCell *textEntryCell = (TextEntryTableViewCell *)cell;
        TextEntryCellViewModel *viewModel = (TextEntryCellViewModel *)cellViewModel;
        [textEntryCell configureWithViewModel:viewModel];
    } else if (cellViewModel.type == CellViewModelTypeColorSelection) {
        ColorSelectorTableViewCell *colorSelectorCell = (ColorSelectorTableViewCell *)cell;
        ColorSelectorCellViewModel *viewModel = (ColorSelectorCellViewModel *)cellViewModel;
        [colorSelectorCell configureWithViewModel:viewModel];
    }
    return cell;
}

- (NSString *)vitaminName {
    return self.textEntryViewModel.value;
}

- (BOOL)validateVitaminProperties {
    return self.textEntryViewModel.value && self.textEntryViewModel.value.length > 3;
}

@end
