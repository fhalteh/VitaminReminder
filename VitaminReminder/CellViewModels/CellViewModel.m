//
//  CellViewModel.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-20.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "CellViewModel.h"

@implementation CellViewModel

- (CellViewModelType)type {
    return CellViewModelTypeDefault;
}

- (NSString *)reuseIdentifier {
    return @"";
}

- (NSString *)nibName {
    return @"";
}

@end
