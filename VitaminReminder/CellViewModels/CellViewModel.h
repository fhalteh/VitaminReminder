//
//  CellViewModel.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-20.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    CellViewModelTypeDefault,
    CellViewModelTypeTextEntry,
    CellViewModelTypeOption,
    CellViewModelTypeDosages,
    CellViewModelTypeSelection,
} CellViewModelType;

@interface CellViewModel : NSObject

- (CellViewModelType)type;
- (NSString *)reuseIdentifier;
- (NSString *)nibName;

@end
