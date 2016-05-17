//
//  ViewController.m
//  工厂模式
//
//  Created by Tianjian on 16/4/28.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "ViewController.h"
#import "FactoryTools.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [FactoryTools efAddController:self WithLeftTitle:@"关闭" withRightTile:@"确定"];
}

- (void)leftOnClick{
    NSLog(@"XXX");
}
- (void)rightOnClick{
    NSLog(@"YYYY");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
