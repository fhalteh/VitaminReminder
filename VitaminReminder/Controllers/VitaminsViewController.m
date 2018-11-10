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

@interface VitaminsViewController ()

@property (weak, nonatomic) IBOutlet UIView *vitaminListContainerView;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (strong) NSManagedObjectContext *managedObjectContext;
@property (strong) AllVitaminsTableVC *allVitaminsTableVC;

@end

@implementation VitaminsViewController

- (instancetype)initWithContext:(NSManagedObjectContext *)context {
    self = [super init];
    if (self) {
        self.managedObjectContext = context;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addAllVitaminsTableVC];
    // Do any additional setup after loading the view from its nib.
}

- (void)addAllVitaminsTableVC {
    self.allVitaminsTableVC = [[AllVitaminsTableVC alloc] initWithDelegate:self
                                                                   context:self.managedObjectContext];
    [self addChildViewController:self.allVitaminsTableVC toContainerView:self.vitaminListContainerView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.headerView addShadow];
}

#pragma mark - Action buttons

- (IBAction)onAddButtonClicked:(id)sender {
    AddOrEditVitaminViewController *viewController = [[AddOrEditVitaminViewController alloc] initWithContext:self.managedObjectContext];
    [self presentViewController:viewController animated:true completion:nil];
}

- (IBAction)onExitButtonClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Styling

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - All vitamins table view delegate

- (void)didSelectVitamin:(Vitamin *)vitamin {
    AddOrEditVitaminViewController *viewController = [[AddOrEditVitaminViewController alloc] initWithVitamin:vitamin];
    [self presentViewController:viewController animated:true completion:nil];
}

@end
