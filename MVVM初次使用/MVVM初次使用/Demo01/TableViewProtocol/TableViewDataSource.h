//
//  TableViewDataSource.h
//  MVVM初次使用
//
//  Created by Tianjian on 16/3/30.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//TableView代理操作
@interface TableViewDelegate : NSObject<UITableViewDelegate>

@property (nonatomic,strong) NSArray *arrList;

@end

//TableView数据源
@interface TableViewDataSource : NSObject<UITableViewDataSource>

@property (nonatomic,strong) NSArray *arrList;

@end
