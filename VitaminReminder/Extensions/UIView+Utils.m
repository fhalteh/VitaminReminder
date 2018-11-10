//
//  UIView+Utils.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "UIView+Utils.h"

@implementation UIView (Utils)

- (void)addCornerRadiusAndShadow {
    self.layer.cornerRadius = 13.0;
    self.layer.shadowOffset = CGSizeMake(0, 3);
    self.layer.shadowRadius = 2;
    self.layer.shadowOpacity = 0.2;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = UIScreen.mainScreen.scale;
}

- (void)addShadow {
    self.layer.shadowOffset = CGSizeMake(0, 3);
    self.layer.shadowRadius = 2;
    self.layer.shadowOpacity = 0.2;
}

- (void)addRoundedCornerRadiusAndShadow {
    self.layer.cornerRadius = self.bounds.size.height/2;
    self.layer.shadowOffset = CGSizeMake(0, 3);
    self.layer.shadowRadius = 2;
    self.layer.shadowOpacity = 0.2;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = UIScreen.mainScreen.scale;
}


@end
