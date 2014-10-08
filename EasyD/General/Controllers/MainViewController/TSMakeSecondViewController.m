//
//  TSMakeSecondViewController.m
//  EasyD
//
//  Created by Aries on 14-10-7.
//  Copyright (c) 2014年 TechSailor. All rights reserved.
//

#import "TSMakeSecondViewController.h"
#import "TSMakeEndViewController.h"

@interface TSMakeSecondViewController ()<UITextViewDelegate>

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
    
    UILabel *inviteLable = [[UILabel alloc] init];
    inviteLable.text = @"写一句对Ta的邀请语";
    inviteLable.frame = CGRectMake( (KscreenW - 320)/2, CGRectGetMaxY(self.progressNaviBar.frame)+ 50, 320, 44);
    inviteLable.contentMode = UIViewContentModeCenter;
    inviteLable.textAlignment = NSTextAlignmentCenter;
    inviteLable.textColor = [UIColor colorWithHexString:@"#ffffff"];
    inviteLable.font = [UIFont systemFontOfSize:15];
    inviteLable.backgroundColor = [UIColor clearColor];
    [self.view addSubview:inviteLable];

    UITextView *inviteText = [[UITextView alloc] init];
    inviteText.autocapitalizationType = UITextAutocapitalizationTypeNone;
    inviteText.delegate = self;
    inviteText.frame  = CGRectMake( 40, CGRectGetMaxY(inviteLable.frame) + 30, 200, 100);
    inviteText.text = @"你丫赶紧给我滚出来，我想你啦";
    [inviteText setTextColor:[UIColor colorWithHexString:@"#cccccc"]];
    [self.view addSubview:inviteText];
    
    UIButton *returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    returnBtn.backgroundColor = [UIColor redColor];
    [returnBtn setTitle:@"上一步" forState:UIControlStateNormal];
    returnBtn.frame = CGRectMake( 50, CGRectGetMaxY(inviteText.frame) + 30, 60, 44);
    [returnBtn addTarget:self action:@selector(returnButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:returnBtn];
    
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.backgroundColor = [UIColor yellowColor];
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    nextBtn.frame = CGRectMake( CGRectGetMaxX(returnBtn.frame) + 30, CGRectGetMaxY(inviteText.frame) + 30, 60, 44);
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
    TSMakeEndViewController *endVC = [[TSMakeEndViewController alloc] init];
    [self.navigationController pushViewController:endVC animated:YES];
}

#pragma mark - UITextView delegate

- (void)textViewDidEndEditing:(UITextView *)textView
{
    
}
- (void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length > 20) {
        [self showProgressHUD:@"只允许输入20个字,且写且珍惜!" delay:1];
        
        textView.text = [textView.text substringToIndex:20];
    }
}
@end
