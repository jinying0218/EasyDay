//
//  TSTemplateViewController.m
//  EasyD
//
//  Created by Aries on 14-10-9.
//  Copyright (c) 2014年 TechSailor. All rights reserved.
//

#import "TSTemplateViewController.h"
#import "TSArrayDataSource.h"

static  NSString *const templateCellIdentifier = @"templateCellIdentifier";

@interface TSTemplateViewController ()<UITableViewDelegate>
@property (nonatomic, strong) UITableView *templateTable;
@property (nonatomic, strong) TSArrayDataSource *dataSource;
@property (nonatomic, strong) NSArray *templateList;
@end

@implementation TSTemplateViewController
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
    self.templateList = @[@"聚会",@"吃饭",@"K歌",@"看电影",@"逛街"];
}

#pragma mark - setupUI
- (void)setupProductTableView
{
    [self createNavigationBarTitle:@"模板欣赏" leftButtonImageName:@"Previous" rightButtonImageName:nil];
    [self.view addSubview:self.navigationBar];
    
    self.templateTable = [[UITableView alloc] initWithFrame:CGRectMake( 0, STATUS_BAR_HEGHT + KnaviBarHeight, KscreenW, KscreenH - STATUS_BAR_HEGHT - KnaviBarHeight) style:UITableViewStylePlain];
    self.templateTable.rowHeight = 44;
    self.templateTable.showsVerticalScrollIndicator = NO;
    self.templateTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    CellConfigureBlock configureCellBlock = ^( UITableViewCell *cell, NSString *productName, NSIndexPath *indexPath){
        cell.textLabel.text = productName;
    };
    self.dataSource = [[TSArrayDataSource alloc] initWithNibName:nil items:self.templateList cellIdentifier:templateCellIdentifier configureCellBlock:configureCellBlock];
    self.templateTable.dataSource = self.dataSource;
    self.templateTable.delegate = self;
    
    [self.view addSubview:self.templateTable];
    
}
#pragma mark - tableViewDelegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end
