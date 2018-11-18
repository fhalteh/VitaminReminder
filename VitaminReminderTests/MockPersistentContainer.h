//
//  MockPersistentContainer.h
//  VitaminReminderTests
//
//  Created by Faris Halteh on 2018-11-17.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface MockPersistentContainerFactory : NSPersistentContainer

+ (NSPersistentContainer *)createVitaminContainer;

@end
