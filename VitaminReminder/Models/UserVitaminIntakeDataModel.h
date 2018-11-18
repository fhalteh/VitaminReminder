//
//  UserVitaminIntakeDataModel.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjectDataModel.h"

@interface UserVitaminIntakeDataModel : ObjectDataModel

@property (nonatomic) NSDate *intakeDate;

+ (UserVitaminIntakeDataModel *)dataModelWithIntakeDate:(NSDate *)date;

@end
