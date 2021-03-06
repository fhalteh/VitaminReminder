//
//  MyVitaminsTableViewController.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-07.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "MyVitaminsTableViewController.h"
#import "Vitamin.h"
#import "VitaminTableViewCell.h"
#import "Dosage.h"
#import "StorageManager.h"
#import "UIView+Utils.h"
#import "VitaminDataModel.h"

@interface MyVitaminsTableViewController ()

@property (weak) id<MyVitaminsTableViewControllerDelegate> delegate;
@property (nonatomic) StorageManager *storageManager;
@property (strong) NSFetchedResultsController *resultsController;

@end

@implementation MyVitaminsTableViewController

- (instancetype)initWithDelegate:(id<MyVitaminsTableViewControllerDelegate>)delegate
                  storageManager:(StorageManager *)storageManager {
    self = [super init];
    if (self) {
        self.delegate = delegate;
        self.storageManager = storageManager;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerNib];
    [self loadResultsController];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self setupNavigationBar];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)setupNavigationBar {
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar addShadow];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(onRightBarButtonClicked)];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    self.title = @"My vitamins";
}

- (void)registerNib {
    NSString *nibName = VitaminTableViewCell.nibName;
    NSString *reuseIdentifier = VitaminTableViewCell.reuseIdentifier;
    [self.tableView registerNib:[UINib nibWithNibName:nibName bundle:nil]
         forCellReuseIdentifier:reuseIdentifier];
}

- (void)loadResultsController {
    self.resultsController = [self.storageManager loadVitaminsFetchedResultsController:self];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = self.resultsController.fetchedObjects.count;
    if (count == 0) {
        EmptyDataView *view = [[EmptyDataView alloc] initWithFrame:self.tableView.frame
                                                             title:@"🙉"
                                                              text:@"Oh no! It seems like you haven't added any vitamins yet"
                                                       buttonTitle:@"Add vitamin"];
        view.delegate = self;
        self.tableView.backgroundView = view;
    } else {
        self.tableView.backgroundView = nil;
    }
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseIdentifier = VitaminTableViewCell.reuseIdentifier;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (cell && [cell isKindOfClass:[VitaminTableViewCell class]]) {
        Vitamin *vitamin = [self.resultsController objectAtIndexPath:indexPath];
        VitaminTableViewCell *vitaminCell = (VitaminTableViewCell *)cell;
        [vitaminCell configureCellWithVitamin:vitamin];
    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 84;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Vitamin *vitamin = [self.resultsController objectAtIndexPath:indexPath];
        [self.storageManager remove:vitamin.objectID];
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Vitamin *vitamin = [self.resultsController objectAtIndexPath:indexPath];
    VitaminDataModel *vitaminDataModel = [[VitaminDataModel alloc] initWithVitamin:vitamin];
    [self.delegate didSelectVitamin:vitaminDataModel];
}

#pragma mark - Fetched results controller delegate

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;
        default:
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {
    
    UITableView *tableView = self.tableView;
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate: {
            VitaminTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
            Vitamin *vitamin = [self.resultsController objectAtIndexPath:indexPath];
            [cell configureCellWithVitamin:vitamin];
        }
            break;
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

#pragma mark - Navigation bar actions

- (void)onRightBarButtonClicked {

    [self.delegate onAddVitaminButtonClicked];
}

#pragma mark - EmptyDataViewDelegate

- (void)onEmptyDataViewButtonClicked {
    [self.delegate onAddVitaminButtonClicked];
}

@end
