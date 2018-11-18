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

- (void)setLeftBarButtonType:(NavigationButtonType)type {
    UIImage *image = [self getImage:type];
    [self.leftBarButton setImage:image forState:UIControlStateNormal];
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
    [self.delegate onLeftBarButtonClicked];
}

- (IBAction)onRightBarButtonClicked:(id)sender {
    [self.delegate onRightBarButtonClicked];
}

@end
