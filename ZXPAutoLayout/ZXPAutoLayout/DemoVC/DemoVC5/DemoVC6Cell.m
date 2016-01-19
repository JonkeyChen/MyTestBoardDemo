//
//  DemoVC6Cell.m
//  Test
//
//  Created by Tianjian on 15/12/28.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "DemoVC6Cell.h"
#import "UIView+SDAutoLayout.h"

@implementation DemoVC6Cell{
    UIImageView *evimgHeader;
    UIImageView *evimgPicture;
    UILabel *evlblName;
    UILabel *evlblContent;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        evimgHeader = [UIImageView new];
        evimgPicture= [UIImageView new];
        evlblName = [UILabel new];
        evlblName.backgroundColor = [UIColor darkGrayColor];
        evlblName.text = @"name";
        evlblContent = [UILabel new];
        [self.contentView addSubview:evimgHeader];
        [self.contentView addSubview:evimgPicture];
        [self.contentView addSubview:evlblName];
        [self.contentView addSubview:evlblContent];
        
        evimgHeader.sd_layout.leftSpaceToView(self.contentView,10).topSpaceToView(self.contentView,10).widthIs(40).heightIs(40);
        evimgHeader.sd_cornerRadiusFromWidthRatio = @(0.5);
        
        evlblName.sd_layout.topEqualToView(evimgHeader).leftSpaceToView(evimgHeader,10).heightIs(18);
        [evlblName setSingleLineAutoResizeWithMaxWidth:[UIScreen mainScreen].bounds.size.width-60];
        
        evlblContent.sd_layout.leftEqualToView(evlblName).topSpaceToView(evlblName,10).rightSpaceToView(self.contentView,10).autoHeightRatio(0);
        
        evimgPicture.sd_layout.leftEqualToView(evlblName).topSpaceToView(evlblContent,10).widthRatioToView(evlblContent,0.9);
    }
    return  self;
}
- (void)setDemoVC6DTO:(DemoVC6DTO *)demoVC6DTO{
    evlblName.text = demoVC6DTO.name;
    evlblContent.text = demoVC6DTO.content;
    evimgHeader.image = [UIImage imageNamed:demoVC6DTO.iconName];
    
    UIImage *pic = [UIImage imageNamed:demoVC6DTO.picName];
    CGFloat scale = pic.size.height/pic.size.width;
    evimgPicture.sd_layout.autoHeightRatio(scale);
    evimgPicture.image = pic;
    
    [self setupAutoHeightWithBottomView:evimgPicture bottomMargin:10];
}

@end
