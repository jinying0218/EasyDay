//
//  TSMakeFirstViewController.m
//  EasyD
//
//  Created by Aries on 14-10-7.
//  Copyright (c) 2014年 TechSailor. All rights reserved.
//

#import "TSMakeFirstViewController.h"
#import "TSMakeSecondViewController.h"

@interface TSMakeFirstViewController ()<UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (nonatomic, strong) UIImagePickerController *imagePickerController;
@property (nonatomic, strong) UIButton *choosePicBtn;
@end

@implementation TSMakeFirstViewController
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
    [self createProgressNavigationBar:@"First"];
    [self.view addSubview:self.progressNaviBar];
    
    UILabel *choosePicLabel = [[UILabel alloc] init];
    choosePicLabel.text = @"选一张和Ta的漂漂合影";
    choosePicLabel.frame = CGRectMake( (KscreenW - 320)/2, CGRectGetMaxY(self.progressNaviBar.frame)+ 50, 320, 44);
    choosePicLabel.contentMode = UIViewContentModeCenter;
    choosePicLabel.textAlignment = NSTextAlignmentCenter;
    choosePicLabel.textColor = [UIColor colorWithHexString:@"#ffffff"];
    choosePicLabel.font = [UIFont systemFontOfSize:15];
    choosePicLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:choosePicLabel];
    
    self.choosePicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.choosePicBtn.frame = CGRectMake( 50, CGRectGetMaxY(choosePicLabel.frame) + 30, 100, 100);
    self.choosePicBtn.backgroundColor = [UIColor yellowColor];
    [self.choosePicBtn setTitle:@"选择照片" forState:UIControlStateNormal];
    [self.choosePicBtn addTarget:self action:@selector(choosePicButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.choosePicBtn];
    
    UIButton *returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    returnBtn.backgroundColor = [UIColor redColor];
    [returnBtn setTitle:@"上一步" forState:UIControlStateNormal];
    returnBtn.frame = CGRectMake( 50, CGRectGetMaxY(self.choosePicBtn.frame) + 30, 60, 44);
    [returnBtn addTarget:self action:@selector(returnButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:returnBtn];

    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.backgroundColor = [UIColor yellowColor];
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    nextBtn.frame = CGRectMake( CGRectGetMaxX(returnBtn.frame) + 30, CGRectGetMaxY(self.choosePicBtn.frame) + 30, 60, 44);
    [nextBtn addTarget:self action:@selector(nextButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    
}
#pragma mark - button actions
- (void)choosePicButtonClick:(UIButton *)button
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从相册选择", nil];
    [actionSheet showInView:[UIApplication sharedApplication].keyWindow];

    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
    }else if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
    }

}
- (void)returnButtonClick:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)nextButtonClick:(UIButton *)button
{
    TSMakeSecondViewController *secondVC = [[TSMakeSecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
}
#pragma mark - UIActionSheetDelegate method
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:{
            self.imagePickerController = [[UIImagePickerController alloc] init];
            [self.imagePickerController setDelegate:self];
            [self.imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
            [self.imagePickerController setAllowsEditing:NO];
            [self presentViewController:self.imagePickerController animated:YES completion:NULL];

        }
            break;
        case 1:{
            self.imagePickerController = [[UIImagePickerController alloc] init];
            [self.imagePickerController setDelegate:self];
            [self.imagePickerController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            [self.imagePickerController setAllowsEditing:NO];
            [self presentViewController:self.imagePickerController animated:YES completion:NULL];

        }
            break;
        default:
            break;
    }
}
#pragma mark - UINavigationControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [self.choosePicBtn setImage:image forState:UIControlStateNormal];
    [self.imagePickerController dismissViewControllerAnimated:YES completion:NULL];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self.imagePickerController dismissViewControllerAnimated:YES completion:NULL];
}
@end
