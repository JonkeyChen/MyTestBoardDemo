//
//  Demo01VC.m
//  MVVM初次使用
//
//  Created by Tianjian on 16/3/30.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "Demo01VC.h"
#import "TableViewDataSource.h"
#import "TableViewCell.h"

@interface Demo01VC (){
    TableViewDataSource *dataSource;
    TableViewDelegate   *delegate;
}
@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) NSArray<NSDictionary *> *arrCtrlNames;

@end

@implementation Demo01VC

- (void)viewDidLoad {
    [super viewDidLoad];
    dataSource = [[TableViewDataSource alloc]init];
    delegate   = [[TableViewDelegate alloc]init];
    dataSource.arrList = @[@"1",@"1",@"1",@"1",@"1",@"1"];
    delegate.arrList   = @[@"1",@"1",@"1",@"1",@"1",@"1"];
    
    self.tableView = ({
        UITableView *ettbl = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStylePlain];
        [ettbl registerClass:[TableViewCell class] forCellReuseIdentifier:@"TableViewCell"];
        ettbl.dataSource   = dataSource;
        ettbl.delegate     = delegate;
        [self.view addSubview:ettbl];
        ettbl;
    });
}


@end
