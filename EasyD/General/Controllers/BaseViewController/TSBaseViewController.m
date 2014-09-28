//
//  TSBaseViewController.m
//  RoutineInspection
//
//  Created by Aries on 14-8-20.
//  Copyright (c) 2014年 Sagitar. All rights reserved.
//

#import "TSBaseViewController.h"
#import "MBProgressHUD.h"


@interface TSBaseViewController ()

@end

@implementation TSBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor blackColor];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    if (IOS7) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }

}
//创建底部scrollView
- (void)createRootScrollView
{
    _rootScrollView = [[TSScrollView alloc]initWithFrame:CGRectMake( 0, STATUS_BAR_HEGHT, KscreenW, KscreenH - STATUS_BAR_HEGHT)];
    _rootScrollView.userInteractionEnabled = YES;
    _rootScrollView.contentSize = CGSizeMake( KscreenW , KscreenH - STATUS_BAR_HEGHT);
    _rootScrollView.backgroundColor = [UIColor whiteColor];
    _rootScrollView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:_rootScrollView];
}
- (void)creatRootView
{
    _rootView = [[TSRootView alloc]initWithFrame:CGRectMake( 0, STATUS_BAR_HEGHT, KscreenW, KscreenH - STATUS_BAR_HEGHT)];
    _rootView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_rootView];
}

- (void)createNavigationBarTitle:(NSString *)title leftButtonImageName:(NSString *)leftImage rightButtonImageName:(NSString *)rightImage
{
    self.navigationBar = [[UIView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEGHT, KscreenW, KnaviBarHeight)];
    self.navigationBar.backgroundColor = [UIColor colorWithHexString:@"#E0655A"];
    self.navigationBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    if (leftImage != nil) {
        UIButton *leftBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
        leftBtn.frame = CGRectMake( 0, 0, 44, 44);
        [leftBtn setImage:[UIImage imageNamedString:leftImage] forState:UIControlStateNormal];
        [leftBtn setImage:[UIImage imageNamedString:[NSString stringWithFormat:@"%@_highlighted",leftImage]] forState:UIControlStateHighlighted];
        [leftBtn setImageEdgeInsets:UIEdgeInsetsMake( 6, 10, 6, 0)];
        [leftBtn addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        leftBtn.backgroundColor = [UIColor clearColor];
        [self.navigationBar addSubview:leftBtn];
        
    }
    if (rightImage != nil) {
        UIButton *rightBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
        rightBtn.frame = CGRectMake( KscreenW - 36, 9, 24, 25);
        if ([rightImage isEqualToString:@"redbook_btn"]) {
            [rightBtn setImage:[UIImage imageNamedString:rightImage] forState:UIControlStateNormal];
            [rightBtn setImage:[UIImage imageNamedString:[NSString stringWithFormat:@"%@_highlighted",rightBtn]] forState:UIControlStateHighlighted];
        }else if ([rightImage isEqualToString:@"edit_btn"]){
            [rightBtn setImage:[UIImage imageNamedString:rightImage] forState:UIControlStateNormal];
            [rightBtn setImage:[UIImage imageNamedString:@"nav_cancel"] forState:UIControlStateSelected];
        }
        [rightBtn addTarget:self action:@selector(rightButtonOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.navigationBar addSubview:rightBtn];
    }
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = title;
    titleLabel.frame = CGRectMake( (KscreenW - 320)/2, 0, 320, 44);
    titleLabel.contentMode = UIViewContentModeCenter;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor colorWithHexString:@"#ffffff"];
    titleLabel.font = [UIFont systemFontOfSize:20];
    titleLabel.backgroundColor = [UIColor clearColor];
    [self.navigationBar addSubview:titleLabel];
    
}

- (void)leftButtonClick:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)rightButtonOnClick:(UIButton *)button
{
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
#pragma mark - 提示框
- (void)showProgressHUD:(NSString *)content delay:(double)delaySeconds
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = content;
    dispatch_time_t poptime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delaySeconds * NSEC_PER_SEC));
    dispatch_after(poptime, dispatch_get_main_queue(), ^{
        [hud hide:YES];
    });
}
- (void)showProgressHUD
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}
- (void)hideProgressHUD
{
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
