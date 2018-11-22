//
//  Coordinator.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class StorageManager;

@protocol Coordinator <NSObject>

@property (nonatomic, strong) UIViewController *rootViewController;
@property (nonatomic, strong) StorageManager *storageManager;

@optional
- (void)start;

@end
