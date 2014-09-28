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
    self.view.backgroundColor = [UIColor lightGrayColor];
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

    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake( 0, 0, KscreenW, KscreenH)];
//    self.webView.scalesPageToFit = YES;
    self.webView.backgroundColor = [UIColor yellowColor];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"index" ofType:@"html"];
    NSStringEncoding strEncode = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingHZ_GB_2312);

    NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:strEncode error:nil];
    
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:filePath]];
//    [_webView loadRequest:request];
    [self.webView loadHTMLString:htmlString baseURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    self.webView.delegate = self;
    [_scrollView addSubview:self.webView];
    
    UIView *secondView = [[UIView alloc] initWithFrame:CGRectMake( KscreenW, 0, KscreenW, KscreenH)];
    [_scrollView addSubview:secondView];
    
    UILabel *firstLabel = [[UILabel alloc] initWithFrame:CGRectMake( 40, (KscreenH - 40)/3,  KscreenW - 40, 40)];
    firstLabel.numberOfLines = 1;
    firstLabel.font = [UIFont systemFontOfSize:15];
    firstLabel.text = @"好约——这是现在最流行的约会方式";
    
    NSMutableAttributedString *attributeString =[[NSMutableAttributedString alloc] initWithString:firstLabel.text];
    [attributeString setAttributes: @ { NSForegroundColorAttributeName : [UIColor redColor], NSFontAttributeName : [UIFont systemFontOfSize: 24] }  range:NSMakeRange( 0, 2)];
    firstLabel.attributedText = attributeString;
    [secondView addSubview:firstLabel];
    
    UILabel *secondLabel = [[UILabel alloc] initWithFrame:CGRectMake( 40, CGRectGetMaxY(firstLabel.frame),  KscreenW - 40, 80)];
    secondLabel.numberOfLines = 2;
    secondLabel.font = [UIFont systemFontOfSize:15];
    secondLabel.text = @"情侣约会，闺蜜逛街，兄弟聚会，想约，不用好约，low爆啦！";
    [secondView addSubview:secondLabel];

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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
