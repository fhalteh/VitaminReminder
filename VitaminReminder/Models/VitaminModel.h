//
//  VitaminModel.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Color.h"

@class DaysDataModel, DosageDataModel;

@interface VitaminModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *notes;
@property (nonatomic) AppearanceColor color;
@property (nonatomic, strong) DaysDataModel *days;
@property (nonatomic, strong) NSArray <DosageDataModel *> *dosages;

@end
