//
//  CustomNavigationBar.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    NavigationButtonTypeAdd,
    NavigationButtonTypeRightArrow,
    NavigationButtonTypeLeftArrow,
} NavigationButtonType;

@protocol CustomNavigationBarDelegate

- (void)onLeftBarButtonClicked;
- (void)onRightBarButtonClicked;

@end

@interface CustomNavigationBar : UIView
// TODO: should they be public?
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

// TODO: move to inside
@property (weak, nonatomic) IBOutlet UIButton *leftBarButton;
@property (weak, nonatomic) IBOutlet UIButton *rightBarButton;
@property (weak, nonatomic) id <CustomNavigationBarDelegate> delegate;

- (void)updateTitle:(NSString *)title;
- (void)setRightBarButtonHidden:(BOOL)hidden;
- (void)setLeftBarButtonHidden:(BOOL)hidden;
- (void)setRightBarButtonType:(NavigationButtonType)type;
- (void)setLeftBarButtonType:(NavigationButtonType)type;

@end
