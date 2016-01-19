//
//  DemoVC2.m
//  Test
//
//  Created by Tianjian on 15/12/25.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "DemoVC2.h"

@interface DemoVC2 ()

@end

@implementation DemoVC2


#pragma mark -initMethod
- (void)initXibProperty{
    self.view0.sd_layout.leftSpaceToView(self.view,10).topSpaceToView(self.view,10).widthIs(80).heightIs(80);
    self.view1.sd_layout.leftSpaceToView(self.view0,10).topEqualToView(self.view0).rightSpaceToView(self.view,10);
    self.view2.sd_layout.leftSpaceToView(self.view,10).rightSpaceToView(self.view,10).topSpaceToView(self.view1,10).heightIs(90);
    self.view3.sd_layout.leftEqualToView(self.view0).widthRatioToView(self.view0,1).heightRatioToView(self.view0,1).topSpaceToView(self.view2,10);
    self.view4.sd_layout.leftSpaceToView(self.view3,10).topEqualToView(self.view3).rightSpaceToView(self.view,10).bottomSpaceToView(self.view,10);
    
    UILabel *lbl = [UILabel new];
    lbl.text = @"dsldjfldjfldsjflsfjslfjdfdldsldjfldjfldsjflsfjslfjdfdldsldjfldjfldsjflsfjslfjdfdldsldjfldjfldsjflsfjslfjdfdldsldjfldfldsjflsfjslfjdfdlndsldjfldjfldsjflsfjslfjdfdldsldjfldjfldsjflsfjslfjdfdldsldjfldjfldsjflsfjslfjdfdldsldjfldjfldsjflsfjslfjdfdldsldjfldjfldsjflsfjslfjdfdl";
    UIView *v = [UIView new];
    v.backgroundColor = [UIColor purpleColor];
    [self.view1 addSubview:lbl];
    [self.view1 addSubview:v];
    
    lbl.sd_layout.autoHeightRatio(0).spaceToSuperView(UIEdgeInsetsMake(10, 10, 0, 10));
    v.sd_layout.topSpaceToView(lbl,10).widthRatioToView(lbl,1).heightIs(30).leftEqualToView(lbl);
    [self.view1 setupAutoHeightWithBottomView:v bottomMargin:10];
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
