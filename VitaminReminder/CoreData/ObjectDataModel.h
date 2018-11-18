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
    ObjectDataModelTypeUserVitaminIntake, // TODO:
    ObjectDataModelTypeDays,
    ObjectDataModelTypeUndefined,
} ObjectDataModelType;
// TODO: should add more?

//@protocol ObjectDataModel <NSObject>
//
//- (ObjectDataModelType)getType;
//
//@end

@interface ObjectDataModel : NSObject

- (ObjectDataModelType)getType;

@end
