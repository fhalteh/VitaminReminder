//
//  VitaminIntakePagingViewController.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-18.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "VitaminIntakePagingViewController.h"
#import "MainViewController.h"

@interface VitaminIntakePagingViewController ()

@end

@implementation VitaminIntakePagingViewController

//- (UIPageViewControllerTransitionStyle)transitionStyle {
//    return UIPageViewControllerTransitionStyleScroll;
//}

- (instancetype)init {
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    if (self) {
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = self;
    self.delegate = self;
    MainViewController *mainViewController = [MainViewController new];
    mainViewController.storageManager = self.storageManager;
    [self setViewControllers:@[mainViewController] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    // Do any additional setup after loading the view from its nib.
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    MainViewController *mainViewController = [MainViewController new];
    mainViewController.storageManager = self.storageManager;
    return mainViewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    MainViewController *mainViewController = [MainViewController new];
    mainViewController.storageManager = self.storageManager;
    return mainViewController;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
