//
//  DosageCollectionViewController.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-07.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DosageCollectionViewControllerDelegate <NSObject>

// TODO: add delegate methods

@end

@interface DosageCollectionViewController : UICollectionViewController <UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray *dosages;

- (instancetype)initWithDelegate:(id<DosageCollectionViewControllerDelegate>)delegate
                         dosages:(NSArray *)dosages;

@end
