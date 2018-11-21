//
//  VitaminsViewController.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-07.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "VitaminsViewController.h"
#import "UIView+Utils.h"
#import "UIViewController+Utils.h"
#import "AddOrEditVitaminViewController.h"
#import "StorageManager.h"
#import "CustomNavigationBar.h"

// TODO: Delete file
// TODO: rename to my vitamins view controller
@interface VitaminsViewController ()


@property (nonatomic, weak) id <MyVitaminsViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIView *vitaminListContainerView;
@property (weak, nonatomic) IBOutlet CustomNavigationBar *headerView;
//@property (strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) StorageManager *storageManager;
@property (strong) AllVitaminsTableVC *allVitaminsTableVC;

@end

@implementation VitaminsViewController

- (instancetype)initWithDelegate:(id <MyVitaminsViewControllerDelegate>)delegate
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
    [self addAllVitaminsTableVC];
    [self setupNavigationBar];
    // Do any additional setup after loading the view from its nib.
}

- (void)setupNavigationBar {
    [self.navigationController.navigationBar setHidden:YES];
    [self.headerView.titleLabel setText:@"My vitamins"];
    [self.headerView setLeftBarButtonHidden:YES];
    [self.headerView setRightBarTextButtonTitle:@"Add"];
//    [self.headerView setRightBarButtonType:NavigationButtonTypeAdd];
    [self.headerView addShadow];// todo
}

- (void)addAllVitaminsTableVC {
    self.allVitaminsTableVC = [[AllVitaminsTableVC alloc] initWithDelegate:self storageManager:self.storageManager];
    [self addChildViewController:self.allVitaminsTableVC toContainerView:self.vitaminListContainerView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self.headerView addShadow];// todo
}

#pragma mark - Action buttons

- (IBAction)onAddButtonClicked:(id)sender {
//    AddOrEditVitaminViewController *viewController = [[AddOrEditVitaminViewController alloc] initWithContext:self.managedObjectContext];
//    [self presentViewController:viewController animated:true completion:nil];
}

- (IBAction)onExitButtonClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - All vitamins table view delegate

- (void)didSelectVitamin:(Vitamin *)vitamin {
    AddOrEditVitaminViewController *viewController = [[AddOrEditVitaminViewController alloc] initWithVitamin:vitamin];
    [self presentViewController:viewController animated:true completion:nil];
}

- (void)onAddVitaminButtonClicked {
    [self.delegate onAddVitaminButtonClicked];
    // TODO: inform the delegate that the add vitamin has been clicked?
}

@end
