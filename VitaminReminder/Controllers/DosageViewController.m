//
//  DosageViewController.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-08.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "DosageViewController.h"
#import "UIView+Utils.h"
#import "Dosage.h"
#import "NSDate+Utils.h"

@interface DosageViewController ()

@property (weak, nonatomic) IBOutlet UITextField *numberOfPillsTextField;
@property (weak, nonatomic) IBOutlet UITextField *hoursTextField;
@property (weak, nonatomic) IBOutlet UITextField *minutesTextField;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak) id <DosageViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIView *dosageBackgroundView;

@end

@implementation DosageViewController

- (instancetype)initWithDelegate:(id <DosageViewControllerDelegate>)delegate {
    self = [super init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.addButton addRoundedCornerRadiusAndShadow];
    [self.dosageBackgroundView addCornerRadiusAndShadow];
}

#pragma mark - Actions

- (IBAction)onAddButtonClicked:(id)sender {
    NSString *numberOfPillsText = self.numberOfPillsTextField.text;
    NSString *hours = self.hoursTextField.text;
    NSString *minutes = self.minutesTextField.text;
    // TODO: fix
//    Dosage *dosage = [Dosage new];
//    dosage.numberOfPills = @(numberOfPillsText.intValue);
//    dosage.reminderTime = [NSDate dateFromHours:hours.intValue minutes:minutes.intValue];
    // TODO: inform the delegate
//    [self.delegate onAddDosageClickedWithDosage:dosage];
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - styles

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
