//
//  DemoVC1.m
//  TestReactiveCoaco
//
//  Created by Tianjian on 15/12/30.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "DemoVC1.h"

@interface DemoVC1 ()<UITextFieldDelegate>

@end

@implementation DemoVC1{
    UITextField *evtxf;
}

#pragma mark -initMethod
- (void)initXibProperty{
    
    evtxf = [[UITextField alloc]initWithFrame:CGRectMake(0, 64, 200, 0)];
    evtxf.borderStyle = UITextBorderStyleLine;
    evtxf.placeholder = @"输入...";
    evtxf.delegate = self;

    [self.view addSubview:evtxf];
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
-(BOOL)textField:(UITextField*)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string{
    return YES;
}
#pragma mark -Action Respone

#pragma mark -OtherMethod

#pragma mark -Getters and Setters

#pragma mark -Request




@end
