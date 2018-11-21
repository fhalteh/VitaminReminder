//
//  NSUserDefaults+Utils.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "NSUserDefaults+Utils.h"
#import "Constants.h"

@implementation NSUserDefaults (Utils)

/**
 Checks if this is the first launch of the app.

 @return YES if it's the first launch, NO otherwise.
 */
+ (BOOL)isFirstLaunchEver {
    BOOL isFirstLaunch = ![[NSUserDefaults standardUserDefaults] boolForKey:kHasBeenLaunchedBefore];
    if (isFirstLaunch) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kHasBeenLaunchedBefore];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    return isFirstLaunch;
}

@end
