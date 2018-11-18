//
//  MainTabBarController.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>

// TODO: might have to delete this class
@protocol MainTabBarControllerDelegate;

@interface MainTabBarController : UITabBarController

@property (nonatomic, strong) NSArray *tabViewControllers;

- (instancetype)initWithViewControllers:(NSArray *)viewControllers
                               delegate:(id <MainTabBarControllerDelegate>)delegate;

@end


@protocol MainTabBarControllerDelegate <NSObject>

- (void)didSelectItemWithIndex:(int)index;

@end
