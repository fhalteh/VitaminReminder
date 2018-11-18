//
//  VitaminIntakeTableVC.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "VitaminIntakeTableVC.h"
#import "VitaminIntakeTableViewCell.h"
#import "Vitamin.h"
#import "VitaminListGenerator.h"
#import "VitaminIntakeCellModel.h"
#import "AddOrEditVitaminViewController.h"
#import "VitaminIntake.h"
#import "StorageManager.h"

@interface VitaminIntakeTableVC ()

@property (weak) id<VitaminIntakeTableVCDelegate> delegate;
@property (strong) NSArray <VitaminIntakeCellModel *> *vitaminIntakes;
//@property NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) StorageManager *storageManager;

@end

@implementation VitaminIntakeTableVC

-(instancetype)initWithDelegate:(id<VitaminIntakeTableVCDelegate>)delegate
                 storageManager:(StorageManager *)storageManager {
    self = [super init];
    if (self) {
        self.delegate = delegate;
        self.storageManager = storageManager;
        self.currentDate = [NSDate date];
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
    self.vitaminIntakes = [VitaminListGenerator createVitaminsListFromContext:self.storageManager
                                                                         date:self.currentDate];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadVitamins];
    [self.tableView reloadData];
}

- (void)registerNib {
    NSString *nibName = VitaminIntakeTableViewCell.nibName;
    NSString *reuseIdentifier = VitaminIntakeTableViewCell.reuseIdentifier;
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
        view.delegate = self;
        self.tableView.backgroundView = view;
    } else {
        NSLog(@"not nil");
        self.tableView.backgroundView = nil;
    }
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseIdentifier = VitaminIntakeTableViewCell.reuseIdentifier;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (cell && [cell isKindOfClass:[VitaminIntakeTableViewCell class]]) {
        VitaminIntakeCellModel *model = [self.vitaminIntakes objectAtIndex:indexPath.row];
        VitaminIntakeTableViewCell *vitaminIntakeCell = (VitaminIntakeTableViewCell *)cell;
        [vitaminIntakeCell configureCellWithModel:model];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return VitaminIntakeTableViewCell.height;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    VitaminIntakeCellModel *model = [self.vitaminIntakes objectAtIndex:indexPath.row];
    // TODO: if the vitamin has been taken, then we should add a vitamin intake
    
    if (!model.taken) {
        // TODO: Add a vitamin taken instance
//        VitaminIntake *vitaminIntake = [VitaminIntake addVitaminIntakeInContext:self.managedObjectContext];
//        vitaminIntake.vitamin = model.vitamin;
//        vitaminIntake.intakeDate = [NSDate date];
    } else {
        // TODO: Remove the current vitamin intake instance
    }
    model.taken = !model.taken;
    [self.tableView reloadData];
}

//#pragma mark - No vitamins view delegate
//
//- (void)onAddVitaminsButtonClicked {
//    AddOrEditVitaminViewController *viewController = [[AddOrEditVitaminViewController alloc] initWithContext:self.managedObjectContext];
//    [self presentViewController:viewController animated:true completion:nil];
//}

#pragma mark - EmptyDataViewDelegate

- (void)onEmptyDataViewButtonClicked {
    // TODO: add a new vitamin
    NSLog(@"Add a new vitamin");
}

@end
