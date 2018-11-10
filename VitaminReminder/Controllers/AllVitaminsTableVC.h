//
//  AllVitaminsTableVC.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-07.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class Vitamin;

@protocol AllVitaminsTableVCDelegate

- (void)didSelectVitamin:(Vitamin *)vitamin;

@end

@interface AllVitaminsTableVC : UITableViewController <NSFetchedResultsControllerDelegate>

- (instancetype)initWithDelegate:(id<AllVitaminsTableVCDelegate>)delegate
                        context:(NSManagedObjectContext *)context;

@end
