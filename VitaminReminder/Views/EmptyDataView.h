//
//  EmptyDataView.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EmptyDataViewDelegate <NSObject>

- (void)onEmptyDataViewButtonClicked;

@end

@interface EmptyDataView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                        title:(NSString *)title
                         text:(NSString *)text;
- (instancetype)initWithFrame:(CGRect)frame
                        title:(NSString *)title
                         text:(NSString *)text
                  buttonTitle:(NSString *)buttonTitle;

@property (weak) id <EmptyDataViewDelegate> delegate;

@end
