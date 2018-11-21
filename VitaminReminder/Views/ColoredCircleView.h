//
//  ColoredCircleView.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-19.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface ColoredCircleView : UIView

@property (strong, nonatomic) IBInspectable UIColor *color;
@property (nonatomic) IBInspectable BOOL selected;

@end
