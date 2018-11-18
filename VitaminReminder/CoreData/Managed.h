//
//  Managed.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Managed

+ (NSString *)entityName;
+ (NSSortDescriptor *)defaultSortDescriptor;
//@property (strong) NSString *entityName;
//@property (strong) NSArray <NSSortDescriptor *> *defaultSortDescriptors;

@end

