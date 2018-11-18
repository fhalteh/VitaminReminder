//
//  MainTabBarController.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "MainTabBarController.h"


@interface MainTabBarController ()

@property (weak) id <MainTabBarControllerDelegate> mainTabBarDelegate;

@end

@implementation MainTabBarController

- (instancetype)initWithViewControllers:(NSArray *)viewControllers
                               delegate:(id <MainTabBarControllerDelegate>)delegate {
    // TODO: nib name
    self = [super initWithNibName:@"MainTabBarController" bundle:nil];
//    self = [super initWithNibName:@"MainTabBarController" bundle:nil];
    if (self) {
        self.mainTabBarDelegate = delegate;
        self.tabViewControllers = viewControllers;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
    self.tabBar.backgroundColor = [UIColor blueColor]; // REMOVE
    // Do any additional setup after loading the view from its nib.
}

- (void)setTabViewControllers:(NSArray *)tabViewControllers {
    _tabViewControllers = tabViewControllers;
    self.viewControllers = tabViewControllers;
}

- (void)setupView {
//    self.viewControllers = self.tabViewControllers;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    int index = (int)[tabBar.items indexOfObject:item];
    [self.mainTabBarDelegate didSelectItemWithIndex:index];
}


@end
