//
//  TSMyProductionsViewController.m
//  EasyD
//
//  Created by Aries on 14-9-28.
//  Copyright (c) 2014年 TechSailor. All rights reserved.
//

#import "TSMyProductsViewController.h"
#import "TSArrayDataSource.h"

static  NSString *const productionsCellIdentifier = @"productionsCellIdentifier";

@interface TSMyProductsViewController ()<UITableViewDelegate>
@property (nonatomic, strong) UITableView *productTable;
@property (nonatomic, strong) TSArrayDataSource *dataSource;
@property (nonatomic, strong) NSArray *productsList;

@end

@implementation TSMyProductsViewController
#pragma mark - controller methods
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    [self initializeData];
    [self setupProductTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
#pragma mark - initialize
- (void)initializeData
{
    self.productsList = @[@"聚会",@"吃饭",@"K歌",@"看电影",@"逛街"];
}

#pragma mark - setupUI
- (void)setupProductTableView
{
    [self createNavigationBarTitle:@"我的作品" leftButtonImageName:@"Previous" rightButtonImageName:nil];
    [self.view addSubview:self.navigationBar];
    
    self.productTable = [[UITableView alloc] initWithFrame:CGRectMake( 0, STATUS_BAR_HEGHT + KnaviBarHeight, KscreenW, KscreenH - STATUS_BAR_HEGHT - KnaviBarHeight) style:UITableViewStylePlain];
    self.productTable.rowHeight = 44;
    self.productTable.showsVerticalScrollIndicator = NO;
    self.productTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    CellConfigureBlock configureCellBlock = ^( UITableViewCell *cell, NSString *productName, NSIndexPath *indexPath){
        cell.textLabel.text = productName;
    };
    self.dataSource = [[TSArrayDataSource alloc] initWithNibName:nil items:self.productsList cellIdentifier:productionsCellIdentifier configureCellBlock:configureCellBlock];
    self.productTable.dataSource = self.dataSource;
    self.productTable.delegate = self;
    
    [self.view addSubview:self.productTable];

}
#pragma mark - tableViewDelegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
