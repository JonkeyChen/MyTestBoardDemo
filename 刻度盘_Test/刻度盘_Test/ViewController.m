//
//  ViewController.m
//  刻度盘_Test
//
//  Created by Tianjian on 16/3/14.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "ViewController.h"
#import "CircleChartView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    return;
    CircleChartView *circleChartView = [[CircleChartView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-300)*0.5, 100, 300, 400)];
    [self.view addSubview:circleChartView];
}

@end
