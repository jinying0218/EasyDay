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

#pragma mark - controller methods
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - setupUI
- (void)setupFlashView
{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake( 0, 0, KscreenW, KscreenH)];
    _scrollView.contentSize = CGSizeMake( KscreenW * 2, KscreenH);
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    [self.view addSubview:_scrollView];

    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake( 0, 0, KscreenW, KscreenH)];
    self.webView.scalesPageToFit = YES;
    //1)
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"HTMLs"];
    NSString *baseFilePath = [NSString stringWithFormat:@"%@/HTMLs",[[NSBundle mainBundle] bundlePath]];
    //把图片路径转换成HTML的路径
    baseFilePath = [baseFilePath stringByReplacingOccurrencesOfString:@"/" withString:@"//"];
    baseFilePath = [baseFilePath stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSURL *baseURL = [NSURL URLWithString:[NSString stringWithFormat:@"file:/%@//",baseFilePath]];
//    NSLog(@"baseurl = %@",baseURL);

    NSStringEncoding gb2312 = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *htmlstring=[[NSString alloc] initWithContentsOfFile:filePath  encoding:gb2312 error:nil];
    
    [self.webView loadHTMLString:htmlstring baseURL:baseURL];
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
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:mainVC];
    [self.navigationController pushViewController:mainVC animated:YES];
    [UIApplication sharedApplication].keyWindow.rootViewController = nc;

}

#pragma mark - UIWebViewDelegate methods
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{


    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
//    NSString *js = @"document.getElementById('lg').innerHTML";
//    NSString *pageSource = [webView stringByEvaluatingJavaScriptFromString:js];
//    NSLog(@"开始加载");
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
}



@end
