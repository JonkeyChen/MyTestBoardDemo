//
//  TestSource.m
//  TestDataSoureceSepearter
//
//  Created by Tianjian on 16/1/22.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "TestSource.h"

@implementation TestSource

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];

    [cell initConfigureCellWithEntity:self.dataSource[indexPath.row]];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //self.cellDidSelectedBlock(indexPath);
    self.cellDidSelectedBlock(tableView,indexPath);
}

@end
