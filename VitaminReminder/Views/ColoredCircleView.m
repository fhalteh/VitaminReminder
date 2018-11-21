//
//  ColoredCircleView.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-19.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "ColoredCircleView.h"
// TODO: remove this if not used?
@implementation ColoredCircleView

- (UIColor *)color {
    if (!_color) {
        return UIColor.grayColor;
    }
    return _color;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGContextAddEllipseInRect(ctx, rect);
//    CGContextSetFillColor(ctx, CGColorGetComponents([self.color CGColor]));
//    CGContextStrokeEllipseInRect(ctx, rect);
//    CGContextSetStrokeColorWithColor(ctx, UIColor.lightGrayColor.CGColor);
//    //    if (self.selected) {
////        self.layer.borderColor = UIColor.darkGrayColor.CGColor;
////        self.layer.borderWidth = 3.0;
////    }
//    CGContextFillPath(ctx);
}

@end
