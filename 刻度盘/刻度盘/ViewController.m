//
//  ViewController.m
//  刻度盘
//
//  Created by Tianjian on 16/3/14.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "ViewController.h"
#import "CircleChartView.h"
#import "CircleView.h"

@interface ViewController ()

@property (strong,nonatomic) CircleChartView *v ;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{


}
- (void)viewDidAppear:(BOOL)animated{
    _v.percent = 0.25;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _v = [[CircleChartView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)*0.5, 20, 200, 200)];
    [self.view addSubview:_v];
    
    CircleView *circle = [[CircleView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)*0.5, 240, 200, 200)];
    circle.percent = 0.5;
    [self.view addSubview:circle];
}

@end
