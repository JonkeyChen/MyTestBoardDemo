//
//  ViewController.m
//  TestUIViewAnimations
//
//  Created by Tianjian on 16/1/8.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

#define ScreenWidth  [UIScreen mainScreen].bounds.size.height
#define ScreenHeight [UIScreen mainScreen].bounds.size.width
NSString *const cellIndentifier = @"IndentifierViewController";

@implementation ViewController



#pragma mark -initMethod
- (void)initXibProperty{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 40;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIndentifier];
    [self.view addSubview:tableView];
}
- (void)initBaseDataInfo{
    NSString *demoVCString = [NSString stringWithFormat:@"DemoVC1"];
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
    cell.textLabel.text = [NSString stringWithFormat:@"Demo%.ld",indexPath.row+1];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *demoVCString = [NSString stringWithFormat:@"DemoVC%lu",indexPath.row+1];
    UIViewController *demoVC = [NSClassFromString(demoVCString) new];
    [self.navigationController pushViewController:demoVC animated:YES];
}


@end
