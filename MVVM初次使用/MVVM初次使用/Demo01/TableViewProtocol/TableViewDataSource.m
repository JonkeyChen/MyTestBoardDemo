//
//  TableViewDataSource.m
//  MVVM初次使用
//
//  Created by Tianjian on 16/3/30.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "TableViewDataSource.h"
#import "TableViewCell.h"

@implementation TableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",_arrList[indexPath.row]);
}

@end

@implementation TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrList.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",@(indexPath.row)];
    return cell;
}

@end
