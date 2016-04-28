//
//  ViewController.m
//  MVVM初次使用
//
//  Created by Tianjian on 16/3/30.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "ViewController.h"
#import "TableViewDataSource.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) NSArray<NSDictionary *> *arrCtrlNames;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _arrCtrlNames = @[@{@"title":@"dataSource&&delegate分离",@"class":@"Demo01VC"}];
    
    self.tableView = ({
        UITableView *ettblView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-20) style:UITableViewStylePlain];
        ettblView.delegate = self;
        ettblView.dataSource = self;
        [ettblView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellIndentifier"];
        [self.view addSubview:ettblView];
        ettblView;
    });
    
    //UIViewController *classVC = [NSClassFromString([_arrCtrlNames lastObject][@"class"]) new];
    //[self.navigationController pushViewController:classVC animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrCtrlNames.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIndentifier"];
    cell.textLabel.text   = [NSString stringWithFormat:@"%@",_arrCtrlNames[indexPath.row][@"title"]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict = _arrCtrlNames[indexPath.row];
    UIViewController *classVC = [NSClassFromString(dict[@"class"]) new];
    [self.navigationController pushViewController:classVC animated:YES];
}

@end
