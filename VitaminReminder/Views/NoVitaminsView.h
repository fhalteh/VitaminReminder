//
//  NoVitaminsView.h
//  VitaminReminder
//
//  Created by Faris Halteh on 2018-11-06.
//  Copyright © 2018 Faris Halteh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NoVitaminsViewDelegate <NSObject>

- (void)onAddVitaminsButtonClicked;

@end

@interface NoVitaminsView : UIView

@property (weak) id <NoVitaminsViewDelegate> delegate;

@end
