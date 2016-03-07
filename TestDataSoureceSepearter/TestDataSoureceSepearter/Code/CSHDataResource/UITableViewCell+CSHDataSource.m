//
//  UITableViewCell+CSHDataSource.m
//  TestDataSoureceSepearter
//
//  Created by Tianjian on 16/1/22.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "UITableViewCell+CSHDataSource.h"

@implementation UITableViewCell (CSHDataSource)

/**返回nib*/
+ (UINib*)initNib{
    NSLog(@"NSStringFromClass([self class]) = %@",NSStringFromClass([self class]));
    return [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
}

/**根据实体，设置cell样式*/
- (void)initConfigureCellWithEntity:(id)entity{
}

@end
