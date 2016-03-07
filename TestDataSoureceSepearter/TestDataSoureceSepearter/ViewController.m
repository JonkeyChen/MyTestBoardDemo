//
//  ViewController.m
//  TestDataSoureceSepearter
//
//  Created by Tianjian on 16/1/22.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "ViewController.h"
#import "TestModel.h"
#import "TestSource.h"
#import "TestCell.h"

@interface ViewController ()

@property (strong,nonatomic) NSMutableArray *dataSourceList;

@property (strong,nonatomic) TestSource *dataSource;

@end

@implementation ViewController

#pragma mark -initMethod
- (void)initXibProperty{
    
}
- (void)initBaseDataInfo{
    
    //1.初始化数据
    _dataSourceList = [NSMutableArray array];
    for (int i = 0; i< 4; i++) {
        TestModel *model = [[TestModel alloc]init];
        model.name = [NSString stringWithFormat:@"张三%d号",i];
        model.imageName = [NSString stringWithFormat:@"00%d.png",i+1];
        [_dataSourceList addObject:model];
        [_dataSourceList addObject:model];
        [_dataSourceList addObject:model];
        [_dataSourceList addObject:model];
    }
    
    //2.复用cell设置
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TestCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([TestCell class])];
    
    //3.cell事件
    __weak __typeof(self) weakSelf = self;
    CSHCellDidSelectedBlock cellDidSelectedBlock = ^(UITableView *tableView,NSIndexPath *indexPath){
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf _efTableViewDidSelected:tableView didSelectedIndexPatch:indexPath];
    };
    
    //4.初始化dataSource
    _dataSource = [[TestSource alloc] initWtihDataSource:nil cellIndentifier:NSStringFromClass([TestCell class])];
    _dataSource.cellDidSelectedBlock = cellDidSelectedBlock;
    
    //5.初始化_tableView代理
    _tableView.delegate = _dataSource;
    _tableView.dataSource = _dataSource;
    _tableView.tableFooterView = [UIView new];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _dataSource.dataSource = _dataSourceList;
        [_tableView reloadData];
    });

}
- (void)_efTableViewDidSelected:(UITableView*)tableView didSelectedIndexPatch:(NSIndexPath *)indexPath{
    NSLog(@"%lu",indexPath.row);
}
#pragma mark -Life Cycle
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self initBaseDataInfo];
    [self initXibProperty];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark -Delegate 代理

#pragma mark -Action Respone

#pragma mark -OtherMethod

#pragma mark -Getters and Setters

#pragma mark -Request




@end
