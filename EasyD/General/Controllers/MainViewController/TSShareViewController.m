//
//  TSShareViewController.m
//  EasyD
//
//  Created by Aries on 14-10-8.
//  Copyright (c) 2014年 TechSailor. All rights reserved.
//

#import "TSShareViewController.h"

@interface TSShareViewController ()

@end

@implementation TSShareViewController
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
    [self createNavigationBarTitle:nil leftButtonImageName:@"" rightButtonImageName:@""];
    [self.view addSubview:self.navigationBar];

}


@end
