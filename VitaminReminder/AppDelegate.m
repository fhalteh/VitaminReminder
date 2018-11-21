//
//  AppDelegate.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "AppDelegate.h"
#import "CoreDataStack.h"
#import "MainViewController.h"
#import "AppCoordinator.h"
#import "UIColor+Utils.h"

@interface AppDelegate ()

@property (nonatomic, strong) AppCoordinator *appCoordinator;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [CoreDataStack createVitaminContainer:^(NSPersistentContainer *container) {
        self.persistentContainer = container;
//        UIStoryboard *storyBoard = self.window.rootViewController.storyboard;
        UINavigationController *navController = (UINavigationController *)self.window.rootViewController;
        self.appCoordinator = [[AppCoordinator alloc] initWithNavigationController:navController
                                                                         container:container];
        [self.appCoordinator start];
//        MainViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:MainViewController.identifier];
//        viewController.managedObjectContext = container.viewContext;
//        self.window.rootViewController = viewController;
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
    // TODO:
    // TODO set the text size?
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor whiteColor], NSForegroundColorAttributeName,
      [UIFont fontWithName:@"proximanova-bold" size:22.0], NSFontAttributeName,nil]];

//    [[UINavigationBar appearance] setColor]
//    navigationBarAppearace.titleTextAttributes =[NSForegroundColorAttributeName:UIColor.whiteColor()]
;
//    appearance
//    var navigationBarAppearace = UINavigationBar.appearance()
//    navigationBarAppearace.tintColor = uicolorFromHex(0xffffff)
//    navigationBarAppearace.barTintColor = uicolorFromHex(0x034517)

}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self saveContext];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
}


- (void)applicationWillTerminate:(UIApplication *)application {
    [self saveContext];
}


#pragma mark - Core Data stack

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"VitaminReminder"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
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
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
