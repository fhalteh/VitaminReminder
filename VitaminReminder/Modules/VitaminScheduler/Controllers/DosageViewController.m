//
//  DosageViewController.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-08.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "DosageViewController.h"
#import "UIView+Utils.h"
#import "NSDate+Utils.h"
#import "UIAlertController+Utils.h"
#import "DosageDataModel.h"

@interface DosageViewController ()

@property (weak, nonatomic) IBOutlet UIView *darkBackgroundView;
@property (weak, nonatomic) IBOutlet UITextField *numberOfPillsTextField;
@property (weak, nonatomic) IBOutlet UITextField *timeTextField;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIView *dosageBackgroundView;
@property (strong, nonatomic) IBOutlet UIView *doneInputAccessoryView;
@property (strong, nonatomic) IBOutlet UIDatePicker *timePickerView;
@property (strong, nonatomic) IBOutlet UIPickerView *numberOfPillsPickerView;

@property (nonatomic, strong) NSArray *numberofPillsValues;
@property (nonatomic, strong) DosageDataModel *dosageDataModel;
@property (weak) id <DosageViewControllerDelegate> delegate;

@end

@implementation DosageViewController

- (instancetype)initWithDelegate:(id <DosageViewControllerDelegate>)delegate {
    self = [super init];
    if (self) {
        self.dosageDataModel = [DosageDataModel new];
        self.delegate = delegate;
        self.numberofPillsValues = @[@(1), @(2), @(3), @(4), @(5), @(6), @(7)];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)setupViews {
    self.numberOfPillsPickerView.delegate = self;
    self.numberOfPillsPickerView.dataSource = self;
    self.numberOfPillsTextField.inputView = self.numberOfPillsPickerView;
    self.numberOfPillsTextField.inputAccessoryView = self.doneInputAccessoryView;
    self.dosageDataModel.time = NSDate.date;
    self.timeTextField.inputView = self.timePickerView;
    self.timeTextField.inputAccessoryView = self.doneInputAccessoryView;
    self.timeTextField.text = NSDate.date.inHoursAndMinutes;
    [self.timePickerView addTarget:self action:@selector(onTimePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    self.timePickerView.backgroundColor = UIColor.whiteColor;
    self.dosageDataModel.numberOfPills = 1;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.addButton addRoundedCornerRadiusAndShadow];
    [self.dosageBackgroundView addCornerRadiusAndShadow];
    self.dosageBackgroundView.alpha = 0.0;
    self.dosageBackgroundView.transform = CGAffineTransformMakeScale(1.3, 1.3);
    [UIView animateWithDuration:0.2 animations:^{
        self.darkBackgroundView.alpha = 0.3;
        self.dosageBackgroundView.alpha = 1.0;
        self.dosageBackgroundView.transform = CGAffineTransformIdentity;

    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [UIView animateWithDuration:0.3 animations:^{
        self.darkBackgroundView.alpha = 0;
        self.dosageBackgroundView.transform = CGAffineTransformMakeScale(1.3, 1.3);
        self.dosageBackgroundView.alpha = 0;
    }];
}

#pragma mark - Actions

- (IBAction)onClickOutside:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onDoneClicked:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)onAddButtonClicked:(id)sender {
    BOOL isValid = [self validate];
    if (!isValid) {
        [self showAlert];
        return;
    }
    
    [self.delegate onAddDosageClickedWithDosageDataModel:self.dosageDataModel];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)showAlert {
    [UIAlertController showAlertInViewController:self
                                           title:@"Error"
                                         message:@"Please enter correct information"
                                          button:@"OK"];
}

- (BOOL)validate {
    int numberOfPills = self.dosageDataModel.numberOfPills;
    NSDate *time = self.dosageDataModel.time;
    if (!time || !numberOfPills || numberOfPills < 1) {
        return NO;
    }
    return YES;
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.numberofPillsValues.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [NSString stringWithFormat:@"%@", self.numberofPillsValues[row]];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSNumber *numberOfPills = self.numberofPillsValues[row];
    self.dosageDataModel.numberOfPills = numberOfPills.intValue;
    self.numberOfPillsTextField.text = [NSString stringWithFormat:@"%@", numberOfPills];
}

- (void)onTimePickerValueChanged:(UIDatePicker *)datePicker {
    NSString *dateString = datePicker.date.inHoursAndMinutes;
    self.timeTextField.text = dateString;
    self.dosageDataModel.time = datePicker.date;
}

@end
