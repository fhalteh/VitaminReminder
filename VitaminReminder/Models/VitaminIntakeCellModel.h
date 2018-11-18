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

@property (strong) Vitamin *vitamin;
@property (assign) BOOL taken;
@property (strong) NSString *timeAsText;

@end
