//
//  VitaminIntakeCellModel.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vitamin.h"
#import "VitaminIntake.h"
#import "Dosage.h"

@interface VitaminIntakeCellModel : NSObject

// todo store the id instead?

// TODO: Use this dosage id
@property (nonatomic, strong) NSManagedObjectID *dosageObjectID;
//@property (strong) Vitamin *vitamin;

@property (nonatomic, strong) NSString *vitaminName;
//@property (assign) BOOL taken; // consider removing this and replace it with a takenTime
@property (nonatomic, strong) NSDate *intakeDate;
@property (nonatomic, strong) NSString *time;

- (BOOL)taken;
@end
