//
//  VitaminSaverViewController.m
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-21.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import "VitaminSaverViewController.h"
#import "VitaminDataModel.h"
#import "StorageManager.h"

@interface VitaminSaverViewController ()

@property (nonatomic, weak) id <VitaminSaverViewControllerDelegate> delegate;
@property (nonatomic, strong) VitaminDataModel *vitaminDataModel;
@property (nonatomic, strong) StorageManager *storageManager;

@end

@implementation VitaminSaverViewController

- (instancetype)initWithVitaminDelegate:(id <VitaminSaverViewControllerDelegate>)delegate
                              dataModel:(VitaminDataModel *)vitaminDataModel
                          storageManager:(StorageManager *)storageManager {
    self = [super init];
    if (self) {
        self.delegate = delegate;
        self.vitaminDataModel = vitaminDataModel;
        self.storageManager = storageManager;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.storageManager addVitaminDataModel:self.vitaminDataModel];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(managedObjectContextObjectsDidChange:) name: NSManagedObjectContextDidSaveNotification object:self.storageManager.backgroundContext];
}

- (void)managedObjectContextObjectsDidChange:(NSNotification *)notification {
    [self.delegate onVitaminSaverCompleted];
}

@end
