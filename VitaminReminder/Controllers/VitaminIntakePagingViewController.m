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

@property (nonatomic, weak) id <VitaminIntakePagingViewControllerDelegate> pagingDelegate;

@end

@implementation VitaminIntakePagingViewController

- (instancetype)initWithDelegate:(id <VitaminIntakePagingViewControllerDelegate>)delegate {
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    if (self) {
        self.pagingDelegate = delegate;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = self;
    self.delegate = self;
    UIViewController *viewController = [self createViewControllerWithDate:NSDate.date];
    [self setViewControllers:@[viewController] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}

- (void)updateViewControllerWithDayChange:(DayChange)dayChange {
    VitaminIntakeTableVC *viewController = self.viewControllers.firstObject;
    NSDate *currentDate = viewController.currentDate;
    NSDate *updatedDate = [currentDate dateAfterDayChange:dayChange];
    UIViewController *newViewController = [self createViewControllerWithDate:updatedDate];
    UIPageViewControllerNavigationDirection direction = [self getDirection:dayChange];
    [self setViewControllers:@[newViewController] direction:direction animated:YES completion:nil];
}

- (UIPageViewControllerNavigationDirection)getDirection:(DayChange)dayChange {
    if (dayChange == DayChangeNext) {
        return UIPageViewControllerNavigationDirectionForward;
    }
    return UIPageViewControllerNavigationDirectionReverse;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSDate *currentDate = ((VitaminIntakeTableVC *)viewController).currentDate;
    NSDate *previousDate = [currentDate dateByRemovingOneDay];
    return [self createViewControllerWithDate:previousDate];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSDate *currentDate = ((VitaminIntakeTableVC *)viewController).currentDate;
    NSDate *nextDate = [currentDate dateByAddingOneDay];
    return [self createViewControllerWithDate:nextDate];
}

#pragma mark - Helper methods

- (UIViewController *)createViewControllerWithDate:(NSDate *)date {
    VitaminIntakeTableVC *viewController = [[VitaminIntakeTableVC alloc] initWithDelegate:self
                                                                           storageManager:self.storageManager];
    viewController.currentDate = date;
    return viewController;
}

#pragma mark - UIPageViewControllerDelegate

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    if (completed) {
        NSDate *updatedDate = ((VitaminIntakeTableVC *)pageViewController.viewControllers.firstObject).currentDate;
        NSLog(@"Updated date: %@", updatedDate);
        NSLog(@"page view controllers: %@", pageViewController.viewControllers);
        [self.pagingDelegate onCurrentDateUpdated:updatedDate];
    }
}

@end
