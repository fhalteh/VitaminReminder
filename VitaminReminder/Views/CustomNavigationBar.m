//
//  CustomNavigationBar.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "CustomNavigationBar.h"
#import "UIView+Utils.h"

#define ALFA_MAX    1
#define ALFA_MIN    0

// TODO: use the custom navigation bar in other places and set it up with the buttons
@interface CustomNavigationBar()

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightButtonWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftButtonWidthConstraint;

//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftBarButtonWidthConstraint;
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightBarButtonWidthConstraint;

@end

@implementation CustomNavigationBar

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
    [[NSBundle mainBundle] loadNibNamed:@"CustomNavigationBar" owner:self options:nil];
    [self addSubview:self.contentView];
    self.contentView.frame = self.bounds;
    self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [self addShadow];
}

- (void)updateTitle:(NSString *)title {
    self.titleLabel.text = title;
}

- (void)setRightBarButtonType:(NavigationButtonType)type {
    UIImage *image = [self getImage:type];
    [self.rightBarButton setImage:image forState:UIControlStateNormal];
}

- (void)setRightBarTextButtonTitle:(NSString *)title {
//    UIImage *image = [self getImage:NavigationButtonTypeAdd];
//    [self.rightBarButton setImage:image forState:UIControlStateNormal];
    [self.rightBarButton setTitle:title forState:UIControlStateNormal];
    self.rightButtonWidthConstraint.constant = 60;
//    self.rightBarButtonWidthConstraint.active = NO;
}

- (void)setLeftBarButtonType:(NavigationButtonType)type {
    UIImage *image = [self getImage:type];
    [self.leftBarButton setImage:image forState:UIControlStateNormal];
}

- (void)setLeftBarTextButtonTitle:(NSString *)title {
//    self.leftBarButton.titleLabel.text = title;
    [self.leftBarButton setTitle:title forState:UIControlStateNormal];
    self.leftButtonWidthConstraint.constant = 60;
//    self.leftBarButtonWidthConstraint.active = NO;
}

- (UIImage *)getImage:(NavigationButtonType)type {
    switch (type) {
        case NavigationButtonTypeAdd:
            return [UIImage imageNamed:@"add"];
        case NavigationButtonTypeLeftArrow:
            return [UIImage imageNamed:@"back"];
        case NavigationButtonTypeRightArrow:
            return [UIImage imageNamed:@"next"];
        default:
            break;
    }
}

- (void)setRightBarButtonHidden:(BOOL)hidden {
    self.rightBarButton.alpha = hidden ? ALFA_MIN : ALFA_MAX;
}

- (void)setLeftBarButtonHidden:(BOOL)hidden {
    self.leftBarButton.alpha = hidden ? ALFA_MIN : ALFA_MAX;
}

- (void)setRightBarButtonImage:(UIImage *)image {
    [self.rightBarButton setImage:image forState:UIControlStateNormal];
}

- (void)setLeftBarButtonImage:(UIImage *)image {
    [self.leftBarButton setImage:image forState:UIControlStateNormal];
}

#pragma mark - Actions

- (IBAction)onLeftBarButtonClicked:(id)sender {
    NSLog(@"left bar button clicked");
    [self.delegate onLeftBarButtonClicked];
}

- (IBAction)onRightBarButtonClicked:(id)sender {
    NSLog(@"Right bar button clicked");
    [self.delegate onRightBarButtonClicked];
}

@end
