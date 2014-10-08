//
//  TSMakeEndViewController.m
//  EasyD
//
//  Created by Aries on 14-10-7.
//  Copyright (c) 2014年 TechSailor. All rights reserved.
//

#import "TSMakeEndViewController.h"
#import "TSShareViewController.h"

#define Tag_TextField 3000

@interface TSMakeEndViewController ()<UITextFieldDelegate>

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
    
    NSArray *labelNameArray = @[@"Ta的大名:",@"约Ta干嘛:",@"地点:",@"时间:"];
    for (int i = 0; i < 4; i ++) {
        UILabel *label = [[UILabel alloc] init];
        label.text = labelNameArray[i];
        label.frame = CGRectMake( 30, CGRectGetMaxY(self.progressNaviBar.frame)+ 40 + i * 30, 70, 30);
        label.contentMode = UIViewContentModeCenter;
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = [UIColor colorWithHexString:@"#ffffff"];
        label.font = [UIFont systemFontOfSize:15];
        label.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:label];

        UITextField *textField = [[UITextField alloc] init];
        textField.delegate = self;
        textField.tag = Tag_TextField + i;
        textField.frame = CGRectMake( CGRectGetMaxX(label.frame) + 15, CGRectGetMinY(label.frame), 150, 30);
        textField.borderStyle = UITextBorderStyleLine;
        textField.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:textField];
    }

    UITextField *textField = (UITextField *)[self.view viewWithTag:Tag_TextField + 3];
    
    UIButton *returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    returnBtn.backgroundColor = [UIColor redColor];
    [returnBtn setTitle:@"上一步" forState:UIControlStateNormal];
    returnBtn.frame = CGRectMake( 30, CGRectGetMaxY(textField.frame) + 100, 60, 44);
    [returnBtn addTarget:self action:@selector(returnButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:returnBtn];
    
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.backgroundColor = [UIColor yellowColor];
    [nextBtn setTitle:@"大功告成" forState:UIControlStateNormal];
    nextBtn.frame = CGRectMake( CGRectGetMaxX(returnBtn.frame) + 30, CGRectGetMaxY(textField.frame) + 100, 60, 44);
    [nextBtn addTarget:self action:@selector(nextButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];

}
#pragma mark - button actions
- (void)returnButtonClick:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)nextButtonClick:(UIButton *)button
{
    TSShareViewController *shareVC = [[TSShareViewController alloc] init];
    [self.navigationController pushViewController:shareVC animated:YES];
}

@end
