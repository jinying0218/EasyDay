//
//  TSFlashViewController.m
//  EasyD
//
//  Created by Aries on 14-9-25.
//  Copyright (c) 2014年 TechSailor. All rights reserved.
//

#import "TSFlashViewController.h"
#import "TSMainViewController.h"

@interface TSFlashViewController ()<UIScrollViewDelegate,UIWebViewDelegate>
{
    UIScrollView *_scrollView;
}

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation TSFlashViewController

- (void)viewDidAppear:(BOOL)animated
{
    [UIApplication sharedApplication].statusBarHidden = YES;
}
- (void)viewDidDisappear:(BOOL)animated
{
    [UIApplication sharedApplication].statusBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupFlashView];
}

- (void)setupFlashView
{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake( 0, 0, KscreenW, KscreenH)];
    _scrollView.contentSize = CGSizeMake( KscreenW * 2, KscreenH);
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    [self.view addSubview:_scrollView];

    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake( 0, STATUS_BAR_HEGHT, KscreenW, KscreenH)];
    self.webView.scalesPageToFit = YES;
    self.webView.backgroundColor = [UIColor yellowColor];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"index" ofType:@"html"];
    NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [self.webView loadHTMLString:htmlString baseURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    self.webView.delegate = self;
    [_scrollView addSubview:self.webView];
    
    UIView *secondView = [[UIView alloc] initWithFrame:CGRectMake( KscreenW, 0, KscreenW, KscreenH)];
    [_scrollView addSubview:secondView];
    
    
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setTitle:@"登陆好约" forState:UIControlStateNormal];
    loginBtn.frame = CGRectMake( (KscreenW - 100)/2, 2*(KscreenH - 40)/3, 100, 40);
    [loginBtn addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [secondView addSubview:loginBtn];
    
}

- (void)loginButtonClick:(UIButton *)button
{
    TSMainViewController *mainVC = [[TSMainViewController alloc] init];
    [self.navigationController pushViewController:mainVC animated:YES];
    [UIApplication sharedApplication].keyWindow.rootViewController = mainVC;

}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"开始加载");
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"加载完成");
}
//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
//{
//    if(scrollView.contentOffset.x > (KscreenW + KscreenW/2))
//    {
//        
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
