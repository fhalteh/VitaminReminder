//
//  AppDelegate.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "AppDelegate.h"
#import "PersistentContainerFactory.h"
#import "MainViewController.h"
#import "AppCoordinator.h"
#import "UIColor+Utils.h"

@interface AppDelegate ()

@property (nonatomic, strong) AppCoordinator *appCoordinator;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [PersistentContainerFactory createVitaminContainer:^(NSPersistentContainer *container) {
        self.persistentContainer = container;
        UINavigationController *navController = (UINavigationController *)self.window.rootViewController;
        self.appCoordinator = [[AppCoordinator alloc] initWithRootViewController:navController
                                                                         container:container];
        [self.appCoordinator start];
    }];
    [self setupNavigationBarAppearance];
    return YES;
}

- (void)setupNavigationBarAppearance {
    [[UINavigationBar appearance] setTintColor:UIColor.whiteColor];
    [[UINavigationBar appearance] setBarTintColor:UIColor.turquoiseThemeColor];
    [[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          [UIColor whiteColor], NSForegroundColorAttributeName,
                                                          [UIFont fontWithName:@"proximanova-light" size:18.0], NSFontAttributeName,nil] forState:UIControlStateNormal];
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor whiteColor], NSForegroundColorAttributeName,
      [UIFont fontWithName:@"proximanova-bold" size:22.0], NSFontAttributeName,nil]];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self saveContext];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self saveContext];
}


#pragma mark - Core Data stack

- (NSPersistentContainer *)persistentContainer {
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"VitaminReminder"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // TODO: should notify the user instead
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // TODO: should notify the user instead
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
