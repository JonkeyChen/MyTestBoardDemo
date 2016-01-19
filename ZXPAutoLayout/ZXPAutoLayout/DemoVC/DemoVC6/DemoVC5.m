
//
//  DemoVC5.m
//  Test
//
//  Created by Tianjian on 15/12/29.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "DemoVC5.h"

@interface DemoVC5 ()

@end

@implementation DemoVC5


#pragma mark -initMethod
- (void)initXibProperty{
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
    
    [self initXibProperty];
    [self initBaseDataInfo];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark -Delegate 代理

#pragma mark -Action Respone

#pragma mark -OtherMethod

#pragma mark -Getters and Setters

#pragma mark -Request
- (void)dealloc{
    NSLog(@"xxxx");
}



@end
