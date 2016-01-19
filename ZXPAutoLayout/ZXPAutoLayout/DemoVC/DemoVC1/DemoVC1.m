//
//  DemoVC1.m
//  Test
//
//  Created by Tianjian on 15/12/25.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "DemoVC1.h"

@interface DemoVC1 ()

@end

@implementation DemoVC1


#pragma mark -initMethod
- (void)initXibProperty{
    self.view0.sd_layout.leftSpaceToView(self.view,10).topSpaceToView(self.view,100).widthRatioToView(self.view,0.4).heightIs(80);
    self.view1.sd_layout.leftSpaceToView(self.view0,10).topSpaceToView(self.view,100).widthRatioToView(self.view,0.2).heightRatioToView(self.view0,0.5);
    self.view2.sd_layout.leftEqualToView(self.view1).topSpaceToView(self.view1,10).bottomEqualToView(self.view0).widthRatioToView(self.view1,1);
    self.view3.sd_layout.leftSpaceToView(self.view2,10).topEqualToView(self.view1).rightSpaceToView(self.view,10).heightRatioToView(self.view1,1);
    self.view4.sd_layout.leftEqualToView(self.view3).topEqualToView(self.view2).widthRatioToView(self.view3,1).heightRatioToView(self.view2,1);
    
    CGFloat width = ([UIScreen mainScreen].bounds.size.width-3*10)/2.0;
    self.view5.sd_layout.leftEqualToView(self.view0).topSpaceToView(self.view0,20).bottomSpaceToView(self.view,10).widthIs(width);
    self.view6.sd_layout.rightEqualToView(self.view3).topEqualToView(self.view5).widthRatioToView(self.view5,1).heightRatioToView(self.view5,1);
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
    [self.view setBackgroundColor:[UIColor whiteColor]];
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
