//
//  EmptyDataView.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "EmptyDataView.h"
#import "UIView+Utils.h"

@interface EmptyDataView()

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UIButton *actionButton;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *buttonTitle;

@end

@implementation EmptyDataView

- (instancetype)initWithFrame:(CGRect)frame
                        title:(NSString *)title
                         text:(NSString *)text {
    self = [super initWithFrame:frame];
    if (self) {
        self.title = title;
        self.text = text;
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
                        title:(NSString *)title
                         text:(NSString *)text
                  buttonTitle:(NSString *)buttonTitle {
    NSLog(@"EmptyDataView init called");
    self = [super initWithFrame:frame];
    if (self) {
        self.title = title;
        self.text = text;
        self.buttonTitle = buttonTitle;
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    [[NSBundle mainBundle] loadNibNamed:@"EmptyDataView" owner:self options:nil];
    [self addSubview:self.contentView];
    self.contentView.frame = self.bounds;
    self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    self.titleLabel.text = self.title;
    self.textLabel.text = self.text;
    if (self.buttonTitle) {
        self.actionButton.hidden = NO;
        [self.actionButton setTitle:self.buttonTitle forState:UIControlStateNormal];
    } else {
        self.actionButton.hidden = YES;
    }
    [self.actionButton addRoundedCornerRadiusAndShadow];
}

#pragma mark - Actions

- (IBAction)onActionButtonClicked:(id)sender {
    if (self.delegate) {
        [self.delegate onEmptyDataViewButtonClicked];
    }
}

@end
