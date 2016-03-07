//
//  UITableViewCell+CSHDataSource.h
//  TestDataSoureceSepearter
//
//  Created by Tianjian on 16/1/22.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (CSHDataSource)

/**返回nib*/
+ (UINib*)initNib;

/**根据实体，设置cell样式*/
- (void)initConfigureCellWithEntity:(id)entity;

@end
