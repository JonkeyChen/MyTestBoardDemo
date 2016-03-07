//
//  CSHBaseDataSourece.h
//  TestDataSoureceSepearter
//
//  Created by Tianjian on 16/1/22.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UITableViewCell+CSHDataSource.h"

typedef void(^CSHCellDidSelectedBlock)(UITableView *tableView,NSIndexPath *indexPath);

@interface CSHBaseDataSource : NSObject <UITableViewDelegate,UITableViewDataSource>

@property (copy,nonatomic) NSString *cellIdentifier; //cell选择样式
@property (copy,nonatomic) NSArray  *dataSource;      //cell数据
@property (copy,nonatomic) CSHCellDidSelectedBlock cellDidSelectedBlock;//cell点击事件

/**
 *  初始化dataSource
 *
 *  @param dataSource  数据
 *  @param indentifier cell类型
 *
 *  @return DataSource
 */
- (instancetype)initWtihDataSource:(NSArray*)dataSource cellIndentifier:(NSString*)identifier;

@end
