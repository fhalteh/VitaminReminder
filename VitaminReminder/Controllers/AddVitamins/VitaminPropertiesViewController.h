//
//  VitaminPropertiesContentViewController.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-19.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VitaminPropertiesViewModel.h"
#import "VitaminDataModel.h"

@protocol VitaminPropertiesViewControllerDelegate

- (void)onVitaminPropertiesCancelClicked;
- (void)onVitaminPropertiesNextClickedWithVitaminDataModel:(VitaminDataModel *)vitaminDataModel;

@end

@interface VitaminPropertiesViewController : UITableViewController <UITextFieldDelegate>

// Do we need thhis to be public?

- (instancetype)initWithDelegate:(id <VitaminPropertiesViewControllerDelegate>)delegate;
//- (BOOL)validate;
//- (NSString *)vitaminName;

@end

