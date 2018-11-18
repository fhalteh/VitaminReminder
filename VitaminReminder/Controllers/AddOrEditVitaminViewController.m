//
//  AddOrEditVitaminViewController.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-07.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "AddOrEditVitaminViewController.h"
#import "UIView+Utils.h"
#import "UIViewController+Utils.h"
#import "Vitamin.h"
#import "DosageCollectionViewCell.h"
#import "Dosage.h"

@interface AddOrEditVitaminViewController ()

@property (weak, nonatomic) IBOutlet UITextField *vitaminNameTextField;

@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIView *dosageContainerView;
@property (strong) DosageCollectionViewController *dosageCollectionViewController;
@property (strong) Vitamin *vitamin;
@property (strong) NSManagedObjectContext *context;
@property (strong) NSArray <Dosage *> *dosages;

@end

@implementation AddOrEditVitaminViewController

- (instancetype)initWithContext:(NSManagedObjectContext *)context {
    self = [super init];
    if (self) {
        self.context = context;
    }
    return self;
}
- (instancetype)initWithVitamin:(Vitamin *)vitamin {
    self = [super init];
    if (self) {
        self.vitamin = vitamin;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dosages = @[]; // TODO: load the vitamin
//    self.dosages = self.vitamin ? self.vitamin.dosage : @[];
    self.dosageCollectionViewController = [[DosageCollectionViewController alloc] initWithDelegate:self dosages:self.dosages];
    [self addChildViewController:self.dosageCollectionViewController toContainerView:self.dosageContainerView];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.vitaminNameTextField.text = self.vitamin ? self.vitamin.name : @"";
    [self.headerView addShadow];
    [self.vitaminNameTextField becomeFirstResponder];
    // scroll to the end
}

#pragma mark - Action buttons

- (IBAction)onCancelButtonClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onSaveButtonClicked:(id)sender {
    if (!self.vitamin) {
        Vitamin *vitamin = [Vitamin addVitaminInContext:self.context];
        vitamin.name = self.vitaminNameTextField.text;
        // TODO:
//        vitamin.dosage = self.dosages;
    } else {
        self.vitamin.name = self.vitaminNameTextField.text;
//        self.vitamin.dosage = self.dosages;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addDosageButtonClicked:(id)sender {
    DosageViewController *dosageViewController = [[DosageViewController alloc] initWithDelegate:self];
    dosageViewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    dosageViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:dosageViewController animated:true completion:nil];
}

#pragma mark - Dosage view controller delegate

- (void)onAddDosageClickedWithDosage:(Dosage *)dosage {
    NSMutableArray *dosages = [NSMutableArray arrayWithArray:self.dosages];
    [dosages addObject:dosage];
    self.dosages = dosages;
    self.dosageCollectionViewController.dosages = dosages;
    [self.dosageCollectionViewController.collectionView reloadData];
}

#pragma mark - Style

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
