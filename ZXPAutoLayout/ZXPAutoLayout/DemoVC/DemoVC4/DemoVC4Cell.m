//
//  DemoVC4Cell.m
//  Test
//
//  Created by Tianjian on 15/12/27.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "DemoVC4Cell.h"
#import "UIView+SDAutoLayout.h"
#import "UITableView+SDAutoTableViewCellHeight.h"

@interface DemoVC4Cell ()

@end

@implementation DemoVC4Cell{
    UIView *v1;
    UIView *v2;
    UIView *v3;
    UIView *v4;
    UILabel *lbl1;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        v1 = [UIView new];
        v1.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:v1];
        
        v2 = [UIView new];
        v2.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:v2];
        v3 = [UIView new];
        v3.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:v3];
        v4 = [UIView new];
        v4.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:v4];
        
        lbl1 = [UILabel new];
        lbl1.backgroundColor = [UIColor purpleColor];
        [self.contentView addSubview:lbl1];
        
        v1.sd_layout.leftSpaceToView(self.contentView,10).topSpaceToView(self.contentView,10).widthIs(50).heightIs(50);
        v2.sd_layout.leftSpaceToView(v1,10).rightSpaceToView(self.contentView,10).topEqualToView(v1).heightIs(20);
        lbl1.sd_layout.leftEqualToView(v2).rightEqualToView(v2).topSpaceToView(v2,10).autoHeightRatio(0);
        v3.sd_layout.leftEqualToView(lbl1).widthRatioToView(v2,0.8).heightIs(30).topSpaceToView(lbl1,10);
        v4.sd_layout.leftSpaceToView(v3,10).topEqualToView(v3).rightEqualToView(lbl1).bottomEqualToView(v3);
        
        //***********************高度自适应cell设置步骤 3************************
        [self setupAutoHeightWithBottomView:v4 bottomMargin:10];
    }
    return self;
}

- (void)setText:(NSString *)text{
    lbl1.text = text;
}

@end
