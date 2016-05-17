//
//  FactoryTools.m
//  工厂模式
//
//  Created by Tianjian on 16/4/28.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "FactoryTools.h"

@implementation FactoryTools

+ (void)efAddController:(UIViewController*)target WithLeftTitle:(NSString*)leftTitle withRightTile:(NSString*)rightTitle{
    UIButton *etbtnLeft = [UIButton buttonWithType:UIButtonTypeCustom];
    [etbtnLeft setTitle:leftTitle forState:UIControlStateNormal];
    etbtnLeft.backgroundColor  = [UIColor greenColor];
    [etbtnLeft setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [etbtnLeft.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [target.view addSubview:etbtnLeft];
    etbtnLeft.frame = CGRectMake(10, 20, 40, 20);

    UIButton *etbtnRight = [UIButton buttonWithType:UIButtonTypeCustom];
    [etbtnRight setTitle:rightTitle forState:UIControlStateNormal];
    etbtnRight.backgroundColor  = [UIColor greenColor];
    [etbtnRight setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    [etbtnRight.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [target.view addSubview:etbtnRight];
    etbtnRight.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-50, 20, 40, 20);
    
    #warning 需要实现leftOnClick && rightOnClick方法
    SEL selectorLeft = NSSelectorFromString(@"leftOnClick");
    [etbtnLeft addTarget:target action:selectorLeft forControlEvents:UIControlEventTouchUpInside];
    
    SEL selectorRight = NSSelectorFromString(@"rightOnClick");
    [etbtnRight addTarget:target action:selectorRight forControlEvents:UIControlEventTouchUpInside];
}

@end
