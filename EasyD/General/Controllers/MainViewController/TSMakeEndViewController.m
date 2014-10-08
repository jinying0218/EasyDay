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

@interface TSMakeEndViewController ()<UITextFieldDelegate,UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong) NSArray *pickerDataArray;
@property (nonatomic, strong) UIPickerView *eventPicker;
@end

@implementation TSMakeEndViewController
#pragma mark - controller methods
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeData];
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initializeData
{
    self.pickerDataArray = @[@"聚会",@"K歌",@"吃饭",@"看电影",@"逛街"];
}
#pragma mark - setupUI methods
- (void)setupUI
{
    [self createProgressNavigationBar:@"End"];
    [self.view addSubview:self.progressNaviBar];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
    
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
    
    UITextField *chooseEventField = (UITextField *)[self.view viewWithTag:Tag_TextField + 1];
    
    self.eventPicker = [[UIPickerView alloc] initWithFrame:CGRectMake( CGRectGetMinX(chooseEventField.frame), CGRectGetMaxY(chooseEventField.frame) + 10, 150, self.pickerDataArray.count * 44)];
    self.eventPicker.dataSource = self;
    self.eventPicker.delegate = self;
    [self.eventPicker selectRow:2 inComponent:0 animated:YES];
    [self.view addSubview:self.eventPicker];
    chooseEventField.inputView = self.eventPicker;
    
    UIView *finishChooseBar = [[UIView alloc] initWithFrame:CGRectMake( 0, CGRectGetMinY(self.eventPicker.frame), KscreenW, 44)];
    finishChooseBar.userInteractionEnabled = YES;
    finishChooseBar.backgroundColor = [UIColor blueColor];
    chooseEventField.inputAccessoryView = finishChooseBar;
    
    UIButton *finishChooseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [finishChooseBtn setTitle:@"完成" forState:UIControlStateNormal];
    finishChooseBtn.layer.borderWidth = 1;
    finishChooseBtn.layer.cornerRadius = 5;
    [finishChooseBtn addTarget:self action:@selector(finishChooseButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    finishChooseBtn.frame = CGRectMake( KscreenW - 80, 10, 60, 24);
    [finishChooseBar addSubview:finishChooseBtn];
    
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
- (void)finishChooseButtonClick:(UIButton *)button
{
    NSLog(@"asdfj");
    UITextField *chooseEventField = (UITextField *)[self.view viewWithTag:Tag_TextField + 1];
    chooseEventField.text = self.pickerDataArray[[self.eventPicker selectedRowInComponent:0]];
    [self.view endEditing:YES];
}
- (void)returnButtonClick:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)nextButtonClick:(UIButton *)button
{
    TSShareViewController *shareVC = [[TSShareViewController alloc] init];
    [self.navigationController pushViewController:shareVC animated:YES];
}

#pragma mark - UIPickerViewDataSource delegate method
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.pickerDataArray.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return self.pickerDataArray[row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"%d",row);
}
#pragma  mark - UITextField methods
- (void)textFieldDidChange:(NSNotification *)notification
{
    UITextField *nameTextField = (UITextField *)[self.view viewWithTag:Tag_TextField];
    if (nameTextField.text.length > 20) {
        [self showProgressHUD:@"您这名字也太长了吧(⊙o⊙)…" delay:1];
        nameTextField.text = [nameTextField.text substringToIndex:20];
    }

}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    switch (textField.tag) {
        case Tag_TextField:{

        }
            break;
        case Tag_TextField + 1:{
            
        }
            break;
        case Tag_TextField + 2:{
            
        }
            break;
        case Tag_TextField + 3:{
            
        }
            break;
        default:
            break;
    }
}

@end
