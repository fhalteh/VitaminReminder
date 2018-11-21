//
//  VitaminPropertiesContentViewController.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-19.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VitaminPropertiesViewModel.h"


@protocol VitaminPropertiesViewControllerDelegate

- (void)onVitaminPropertiesCancelClicked;
- (void)onVitaminPropertiesNextClickedWithVitaminName:(NSString *)vitaminName;

@end

@interface VitaminPropertiesViewController : UITableViewController

// Do we need thhis to be public?

- (instancetype)initWithDelegate:(id <VitaminPropertiesViewControllerDelegate>)delegate;
//- (BOOL)validate;
//- (NSString *)vitaminName;

@end

