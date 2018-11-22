//
//  DailyVitaminTableViewController.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "DailyVitaminTableViewController.h"
#import "DailyVitaminTableViewCell.h"
#import "Vitamin.h"
#import "DailyVitaminsFactory.h"
#import "VitaminIntakeCellModel.h"
#import "VitaminIntake.h"
#import "StorageManager.h"
#import "UserVitaminIntakeDataModel.h"

@interface DailyVitaminTableViewController ()

@property (strong) NSArray <VitaminIntakeCellModel *> *vitaminIntakes;

@end

@implementation DailyVitaminTableViewController

- (instancetype)initWithStorageManager:(StorageManager *)storageManager {
    self = [super init];
    if (self) {
        self.storageManager = storageManager;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerNib];
    self.tableView.separatorColor = [UIColor clearColor];
    [self loadVitamins];
}

- (void)loadVitamins {
    self.vitaminIntakes = [DailyVitaminsFactory createVitaminsListFromStorageManager:self.storageManager
                                                                         date:self.currentDate];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadVitamins];
    [self.tableView reloadData];
}

- (void)registerNib {
    NSString *nibName = DailyVitaminTableViewCell.nibName;
    NSString *reuseIdentifier = DailyVitaminTableViewCell.reuseIdentifier;
    [self.tableView registerNib:[UINib nibWithNibName:nibName bundle:nil]
         forCellReuseIdentifier:reuseIdentifier];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = self.vitaminIntakes.count;
    if (count == 0) {
        EmptyDataView *view = [[EmptyDataView alloc] initWithFrame:self.tableView.frame
                                                             title:@"🙌🏻"
                                                              text:@"No vitamins today!"];
        self.tableView.backgroundView = view;
    } else {
        NSLog(@"not nil");
        self.tableView.backgroundView = nil;
    }
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseIdentifier = DailyVitaminTableViewCell.reuseIdentifier;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (cell && [cell isKindOfClass:[DailyVitaminTableViewCell class]]) {
        VitaminIntakeCellModel *model = [self.vitaminIntakes objectAtIndex:indexPath.row];
        DailyVitaminTableViewCell *vitaminIntakeCell = (DailyVitaminTableViewCell *)cell;
        [vitaminIntakeCell configureCellWithModel:model];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return DailyVitaminTableViewCell.height;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    VitaminIntakeCellModel *model = [self.vitaminIntakes objectAtIndex:indexPath.row];
    if (!model.taken) {
        UserVitaminIntakeDataModel *dataModel = [UserVitaminIntakeDataModel new];
        dataModel.intakeDate = NSDate.date;
        model.intakeDate = NSDate.date;
        [self.storageManager addUserVitaminIntake:dataModel
                                   dosageObjectID:model.dosageObjectID];
    } else {
        UserVitaminIntakeDataModel *dataModel = [UserVitaminIntakeDataModel new];
        dataModel.intakeDate = model.intakeDate;
        [self.storageManager removeUserVitaminIntake:dataModel dosageObjectID:model.dosageObjectID];
        model.intakeDate = nil;
    }
    [self.tableView reloadData];
}

@end
