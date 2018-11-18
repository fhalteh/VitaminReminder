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

@class Vitamin, StorageManager;

@protocol AllVitaminsTableVCDelegate

- (void)didSelectVitamin:(Vitamin *)vitamin;

@end

// TODO: remkove one of the delegate - empty view
@interface AllVitaminsTableVC : UITableViewController <NSFetchedResultsControllerDelegate, EmptyDataViewDelegate>

//- (instancetype)initWithDelegate:(id<AllVitaminsTableVCDelegate>)delegate
//                        context:(NSManagedObjectContext *)context;

- (instancetype)initWithDelegate:(id<AllVitaminsTableVCDelegate>)delegate
                  storageManager:(StorageManager *)storageManager;

@end
