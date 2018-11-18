//
//  WelcomeViewController.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "WelcomeViewController.h"
#import "UIView+Utils.h"

@interface WelcomeViewController ()

@property (weak, nonatomic) IBOutlet UIButton *startAppButton;
@property (weak) id <WelcomeViewControllerDelegate> delegate;

@end

@implementation WelcomeViewController

- (instancetype)initWithDelegate:(id <WelcomeViewControllerDelegate>)delegate {
    self = [super init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.startAppButton addRoundedCornerRadiusAndShadow];
}

#pragma mark - Actions

- (IBAction)onStartAppButtonClicked:(id)sender {
    if (self.delegate) {
        [self.delegate onWelcomeViewControllerNextButtonClicked];
    }
}


@end
