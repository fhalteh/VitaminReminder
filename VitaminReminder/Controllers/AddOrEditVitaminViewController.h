//
//  AddOrEditVitaminViewController.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-07.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DosageCollectionViewController.h"
#import "DosageViewController.h"

@class Vitamin;

// TODO: rename
@interface AddOrEditVitaminViewController : UIViewController <DosageCollectionViewControllerDelegate, DosageViewControllerDelegate>

- (instancetype)initWithContext:(NSManagedObjectContext *)context;
- (instancetype)initWithVitamin:(Vitamin *)vitamin;

@end
