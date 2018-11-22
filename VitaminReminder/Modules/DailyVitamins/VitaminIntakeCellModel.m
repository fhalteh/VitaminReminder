//
//  VitaminIntakeCellModel.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "VitaminIntakeCellModel.h"

@implementation VitaminIntakeCellModel

- (BOOL)taken {
    return self.intakeDate != nil;
}

@end
