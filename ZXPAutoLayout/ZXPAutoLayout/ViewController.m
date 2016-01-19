//
//  ViewController.m
//  ZXPAutoLayout
//
//  Created by Tianjian on 15/12/22.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "ViewController.h"
#import "ZXPAutoLayout.h"
#import "TestCell.h"
#import "UIView+SDAutoLayout.h"

static NSString* const cellIndentifier = @"TestCell";

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) UITableView *evtblList;

@property (strong,nonatomic) NSMutableArray *arrList;

@end

@implementation ViewController

- (void)initXibProperty{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 40;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIndentifier];
    [self.view addSubview:tableView];
}
- (void)initBaseDataInfo{
    NSString *demoVCString = [NSString stringWithFormat:@"DemoVC8"];
    UIViewController *demoVC = [NSClassFromString(demoVCString) new];
    [self.navigationController pushViewController:demoVC animated:YES];
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
    
    [self initXibProperty];
    [self initBaseDataInfo];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 9;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    cell.textLabel.text = [NSString stringWithFormat:@"Demo%.ld",indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *demoVCString = [NSString stringWithFormat:@"DemoVC%lu",indexPath.row+1];
    UIViewController *demoVC = [NSClassFromString(demoVCString) new];
    [self.navigationController pushViewController:demoVC animated:YES];
}

/*
#pragma mark -initMethod
- (void)initXibProperty{
    
    self.arrList = [NSMutableArray array];
    for (int i = 0; i<20; i++) {
        NSMutableString *string =[NSMutableString stringWithFormat:@"%zi",i];
        NSInteger lenght = arc4random()%30+1;
        for (int j = 0; j< lenght; j++) {
            [string appendString:@"string"];
        }
        [string appendFormat:@"%zi",i];
        [self.arrList addObject:[string description]];
    }
    
    self.evtblList = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.evtblList.delegate = self;
    self.evtblList.dataSource = self;
    [self.view addSubview:self.evtblList];
    
    [self.evtblList registerNib:[UINib nibWithNibName:[[TestCell class] description] bundle:nil]
         forCellReuseIdentifier:CellIndentifier];
}
- (void)initBaseDataInfo{
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
    
    [self initXibProperty];
    [self initBaseDataInfo];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark -Delegate 代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrList.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TestCell *cell = (TestCell*)[tableView dequeueReusableCellWithIdentifier:CellIndentifier];
    [cell load:self.arrList[indexPath.row]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView zxp_cellHeightWithindexPath:indexPath];
}*/



@end
