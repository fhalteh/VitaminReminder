//
//  VitaminDataModel.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Color.h"
#import "ObjectDataModel.h"
#import <CoreData/CoreData.h>
#import "DosageDataModel.h"

@class DaysDataModel, Vitamin;

@interface VitaminDataModel : NSObject <ObjectDataModel>

// To keep track of the current vitamin object in the database (for editing purposes)
@property (nonatomic, strong) NSManagedObjectID *managedObjectId;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *notes; // TODO: delete
@property (nonatomic) AppearanceColor color; // TODO: delete
@property (nonatomic, strong) DaysDataModel *days;
@property (nonatomic, strong) NSMutableArray <DosageDataModel *> *dosages;

- (instancetype)initWithVitamin:(Vitamin *)vitamin;

@end
