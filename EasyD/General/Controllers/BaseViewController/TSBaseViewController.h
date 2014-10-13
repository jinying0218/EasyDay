//
//  TSBaseViewController.h
//  RoutineInspection
//
//  Created by Aries on 14-8-20.
//  Copyright (c) 2014年 Sagitar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSScrollView.h"
#import "TSRootView.h"

@interface TSBaseViewController : UIViewController

@property (nonatomic, strong) TSRootView *rootView;
@property (nonatomic, strong) TSScrollView *rootScrollView;
@property (nonatomic, strong) UIView *navigationBar;
@property (nonatomic, strong) UIView *progressNaviBar;

- (void)createRootScrollView;
- (void)creatRootView;
- (void)createNavigationBarTitle:(NSString *)title leftButtonImageName:(NSString *)leftImage rightButtonImageName:(NSString *)rightImage;
- (void)createProgressNavigationBar:(NSString *)currentStep;

- (void)showProgressHUD:(NSString *)content delay:(double)delaySeconds;
- (void)showProgressHUD;
- (void)hideProgressHUD;
@end
