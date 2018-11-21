//
//  DosageViewController.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-08.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DosageDataModel;

@protocol DosageViewControllerDelegate <NSObject>

- (void)onAddDosageClickedWithDosageDataModel:(DosageDataModel *)dosageDataModel;

@end

@interface DosageViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

- (instancetype)initWithDelegate:(id <DosageViewControllerDelegate>)delegate;
@end
