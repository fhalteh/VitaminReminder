//
//  ObjectDataModel.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    ObjectDataModelTypeVitamin,
    ObjectDataModelTypeDosage,
    ObjectDataModelTypeUserVitaminIntake,
    ObjectDataModelTypeDays,
    ObjectDataModelTypeUndefined,
} ObjectDataModelType;

@protocol ObjectDataModel

- (ObjectDataModelType)getType;

@end
