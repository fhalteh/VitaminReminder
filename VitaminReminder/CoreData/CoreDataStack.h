//
//  CoreDataStack.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataStack : NSObject

+ (void)createVitaminContainer:(void (^)(NSPersistentContainer *))completionBlock;

@end
