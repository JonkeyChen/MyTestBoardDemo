//
//  DemoVC3.m
//  Test
//
//  Created by Tianjian on 15/12/27.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "DemoVC3.h"

@implementation DemoVC3


#pragma mark -initMethod
- (void)initXibProperty{
    
    [self.view0 addSubview:self.view1];
    [self.view1 addSubview:self.view2];
    
    self.view0.sd_layout.leftSpaceToView(self.view,30).rightSpaceToView(self.view,30).topSpaceToView(self.view,30).bottomSpaceToView(self.view,30);
    self.view1.sd_layout.leftSpaceToView(self.view0,10).topSpaceToView(self.view0,10).widthRatioToView(self.view0,0.5).heightRatioToView(self.view0,0.5);
    self.view2.sd_layout.leftSpaceToView(self.view1,10).topSpaceToView(self.view1,10).widthRatioToView(self.view1,0.5).heightRatioToView(self.view1,0.5);
    
    //2秒后重新布局
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.view0.sd_layout.bottomSpaceToView(self.view,100);
        [self.view layoutSubviews];
    });
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

@end
