//
//  MyVitaminsTableViewController.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-07.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "EmptyDataView.h"

@class VitaminDataModel, StorageManager;

@protocol MyVitaminsTableViewControllerDelegate

- (void)didSelectVitamin:(VitaminDataModel *)vitaminDataModel;
- (void)onAddVitaminButtonClicked;

@end

@interface MyVitaminsTableViewController : UITableViewController <NSFetchedResultsControllerDelegate, EmptyDataViewDelegate>

- (instancetype)initWithDelegate:(id<MyVitaminsTableViewControllerDelegate>)delegate
                  storageManager:(StorageManager *)storageManager;

@end
