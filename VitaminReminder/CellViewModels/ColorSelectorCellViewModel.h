//
//  ColorSelectorCellViewModel.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-20.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "CellViewModel.h"
#import "Color.h"

// TODO: remove if not used
@interface ColorSelectorCellViewModel : CellViewModel

@property (nonatomic, assign) AppearanceColor color;
@property (nonatomic, assign) NSString *title;

@end
