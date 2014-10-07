//
//  TSMakeSecondViewController.m
//  EasyD
//
//  Created by Aries on 14-10-7.
//  Copyright (c) 2014年 TechSailor. All rights reserved.
//

#import "TSMakeSecondViewController.h"

@interface TSMakeSecondViewController ()

@end

@implementation TSMakeSecondViewController
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
    [self createProgressNavigationBar:@"Second"];
    [self.view addSubview:self.progressNaviBar];
}

@end
