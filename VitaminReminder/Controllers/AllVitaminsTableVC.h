//
//  AllVitaminsTableVC.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-07.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "EmptyDataView.h"

@class VitaminDataModel, StorageManager;

@protocol AllVitaminsTableViewControllerDelegate

- (void)didSelectVitamin:(VitaminDataModel *)vitaminDataModel;
- (void)onAddVitaminButtonClicked;

@end

// TODO: remkove one of the delegate - empty view

// Rename  to my vitamins
@interface AllVitaminsTableVC : UITableViewController <NSFetchedResultsControllerDelegate, EmptyDataViewDelegate>

//- (instancetype)initWithDelegate:(id<AllVitaminsTableVCDelegate>)delegate
//                        context:(NSManagedObjectContext *)context;

- (instancetype)initWithDelegate:(id<AllVitaminsTableViewControllerDelegate>)delegate
                  storageManager:(StorageManager *)storageManager;

@end
