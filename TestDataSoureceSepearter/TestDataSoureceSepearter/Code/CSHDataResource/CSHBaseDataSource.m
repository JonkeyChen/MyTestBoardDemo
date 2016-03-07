//
//  CSHBaseDataSourece.m
//  TestDataSoureceSepearter
//
//  Created by Tianjian on 16/1/22.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "CSHBaseDataSource.h"

@implementation CSHBaseDataSource

- (instancetype)initWtihDataSource:(NSArray*)dataSource cellIndentifier:(NSString*)identifier{
    if (self = [super init]) {
        self.dataSource = dataSource;     //数据
        self.cellIdentifier = identifier; //复用
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = self.cellIdentifier;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    return cell;
}

@end
