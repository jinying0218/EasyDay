//
//  TSMakeEndViewController.m
//  EasyD
//
//  Created by Aries on 14-10-7.
//  Copyright (c) 2014年 TechSailor. All rights reserved.
//

#import "TSMakeEndViewController.h"

@interface TSMakeEndViewController ()

@end

@implementation TSMakeEndViewController
#pragma mark - controller methods
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - setupUI methods
- (void)setupUI
{
    [self createProgressNavigationBar:@"End"];
    [self.view addSubview:self.progressNaviBar];
}

@end
