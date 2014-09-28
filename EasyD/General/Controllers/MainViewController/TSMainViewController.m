//
//  TSMainViewController.m
//  EasyD
//
//  Created by Aries on 14-9-25.
//  Copyright (c) 2014年 TechSailor. All rights reserved.
//

#import "TSMainViewController.h"
#import "TSMyProductsViewController.h"

@interface TSMainViewController ()

@property (weak, nonatomic) IBOutlet UIButton *myProductsBtn;
@property (weak, nonatomic) IBOutlet UIButton *sampleBtn;
@property (weak, nonatomic) IBOutlet UIButton *makeBtn;

@end

@implementation TSMainViewController
#pragma mark - controller methods
- (void)viewDidAppear:(BOOL)animated
{
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
#pragma mark - button  actions
- (IBAction)myProductsButtonClick:(UIButton *)sender {
    TSMyProductsViewController *myProductsVC = [[TSMyProductsViewController alloc] init];
    
    [self.navigationController pushViewController:myProductsVC animated:YES];
}
- (IBAction)sampleButtonClick:(UIButton *)sender {
    
}
- (IBAction)makeButtonClick:(UIButton *)sender {

}

@end
