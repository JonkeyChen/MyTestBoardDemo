//
//  BaseVC.m
//  Test
//
//  Created by Tianjian on 15/12/25.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "BaseVC.h"
#import "UIView+SDAutoLayout.h"

@interface BaseVC ()

@end

@implementation BaseVC


#pragma mark -initMethod
- (void)configureUI{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIView *view0 = [UIView new];
    view0.backgroundColor = [UIColor redColor];
    self.view0 = view0;
    
    UIView *view1 = [UIView new];
    view1.backgroundColor = [UIColor grayColor];
    self.view1 = view1;
    
    UIView *view2 = [UIView new];
    view2.backgroundColor = [UIColor brownColor];
    self.view2 = view2;
    
    UIView *view3 = [UIView new];
    view3.backgroundColor = [UIColor orangeColor];
    self.view3 = view3;
    
    UIView *view4 = [UIView new];
    view4.backgroundColor = [UIColor purpleColor];
    self.view4 = view4;
    
    UIView *view5 = [UIView new];
    view5.backgroundColor = [UIColor yellowColor];
    self.view5 = view5;
    
    UIView *view6 = [UIView new];
    view6.backgroundColor = [UIColor cyanColor];
    self.view6 = view6;
    
    UIView *view7 = [UIView new];
    view7.backgroundColor = [UIColor magentaColor];
    self.view7 = view7;
    
    UIView *view8 = [UIView new];
    view8.backgroundColor = [UIColor blackColor];
    self.view8 = view8;
    
    [self.view addSubview:view0];
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:view3];
    [self.view addSubview:view4];
    [self.view addSubview:view5];
    [self.view addSubview:view6];
    [self.view addSubview:view7];
    [self.view addSubview:view8];
}
- (void)initBaseDataInfo{
}
#pragma mark -Life Cycle
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureUI];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark -Delegate 代理

#pragma mark -Action Respone

#pragma mark -OtherMethod

#pragma mark -Getters and Setters
- (NSMutableArray *)arrList{
    if (_arrList == nil) {
        _arrList = [NSMutableArray array];
    }
    return _arrList;
}
- (UITableView *)evtblList{
    if (_evtblList == nil) {
        _evtblList = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _evtblList.delegate = self;
        _evtblList.dataSource = self;
        [self.view addSubview:_evtblList];
    }
    return _evtblList;
}
#pragma mark -Request




@end
