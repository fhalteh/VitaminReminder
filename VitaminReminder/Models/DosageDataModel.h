//
//  DosageDataModel.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjectDataModel.h"

@interface DosageDataModel : ObjectDataModel

@property (nonatomic) int numberOfPills;
@property (nonatomic) NSDate *time;

+ (DosageDataModel *)dataModelWithNumberOfPills:(int)numberOfPills time:(NSDate *)time;

@end
