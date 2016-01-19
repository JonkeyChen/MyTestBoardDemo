//
//  DemoVC7.m
//  Test
//
//  Created by Tianjian on 15/12/28.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "DemoVC7.h"

@interface DemoVC7 ()

@end

@implementation DemoVC7


#pragma mark -initMethod
- (void)initXibProperty{
    /**************************自适应UIScrollView***************************/
    UIScrollView *etsrcContent = [UIScrollView new];
    [self.view addSubview:etsrcContent];

    etsrcContent.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
    
    [etsrcContent addSubview:self.view0];
    [etsrcContent addSubview:self.view1];
    [etsrcContent addSubview:self.view2];
    [etsrcContent addSubview:self.view3];
    [etsrcContent addSubview:self.view4];
    
    self.view0.sd_layout.leftSpaceToView(etsrcContent,20).rightSpaceToView(etsrcContent,20).topSpaceToView(etsrcContent,30).heightIs(100);
    self.view1.sd_layout.leftSpaceToView(etsrcContent,20).rightSpaceToView(etsrcContent,20).topSpaceToView(self.view0,30).heightIs(120);
    self.view2.sd_layout.leftSpaceToView(etsrcContent,20).rightSpaceToView(etsrcContent,20).topSpaceToView(self.view1,30).heightIs(140);
    self.view3.sd_layout.leftSpaceToView(etsrcContent,20).rightSpaceToView(etsrcContent,20).topSpaceToView(self.view2,30).heightIs(160);
    self.view4.sd_layout.leftSpaceToView(etsrcContent,20).rightSpaceToView(etsrcContent,20).topSpaceToView(self.view3,30).heightIs(180);

    [etsrcContent setupAutoContentSizeWithBottomView:self.view4 bottomMargin:10];
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
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
