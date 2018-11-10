//
//  DosageViewController.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-08.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Dosage;

@protocol DosageViewControllerDelegate <NSObject>

- (void)onAddDosageClickedWithDosage:(Dosage *)dosage;

@end

@interface DosageViewController : UIViewController

- (instancetype)initWithDelegate:(id <DosageViewControllerDelegate>)delegate;
@end
