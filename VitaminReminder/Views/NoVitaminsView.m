//
//  NoVitaminsView.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "NoVitaminsView.h"
#import "UIView+Utils.h"

@interface NoVitaminsView()

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *addVitaminsButton;

@end

@implementation NoVitaminsView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    [[NSBundle mainBundle] loadNibNamed:@"NoVitaminsView" owner:self options:nil];
    [self addSubview:self.contentView];
    self.contentView.frame = self.bounds;
    self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [self.addVitaminsButton addRoundedCornerRadiusAndShadow];
}

#pragma mark - Action buttons

- (IBAction)onAddVitaminsClicked:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(onAddVitaminsButtonClicked)]) {
        [self.delegate onAddVitaminsButtonClicked];
    }
}


@end
