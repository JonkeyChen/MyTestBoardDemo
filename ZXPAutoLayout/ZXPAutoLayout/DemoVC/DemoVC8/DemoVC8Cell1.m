//
//  DemoVC8Cell1.m
//  Test
//
//  Created by Tianjian on 15/12/28.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "DemoVC8Cell1.h"
#import "SDWeiXinPhotoContainerView.h"
#import "UIView+SDAutoLayout.h"

@implementation DemoVC8Cell1{
    UIImageView *evimgHeader;
    UILabel *evlblName;
    UILabel *evlblContent;
    UILabel *evlblTime;
    SDWeiXinPhotoContainerView *evimgWeixinPhotoes;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configureUI];
    }
    return self;
}

- (void)configureUI{
    UIView *contentView = self.contentView;
    
    evimgHeader = [UIImageView new];
    evimgHeader.backgroundColor = [UIColor redColor];
    evimgWeixinPhotoes = [SDWeiXinPhotoContainerView new];
    evlblName = [UILabel new];
    evlblContent = [UILabel new];
    evlblTime = [UILabel new];
    evlblTime.font = [UIFont systemFontOfSize:14];
    [contentView addSubview:evimgHeader];
    [contentView addSubview:evimgWeixinPhotoes];
    [contentView addSubview:evlblName];
    [contentView addSubview:evlblContent];
    [contentView addSubview:evlblTime];
    
    evimgHeader.sd_layout.leftSpaceToView(contentView,10).topSpaceToView(contentView,10).widthIs(40).heightIs(40);
    evimgHeader.sd_cornerRadiusFromWidthRatio = @(0.5);
    
    evlblName.sd_layout.topEqualToView(evimgHeader).leftSpaceToView(evimgHeader,10).heightIs(18);
    [evlblName setSingleLineAutoResizeWithMaxWidth:100];
    
    evlblContent.sd_layout.leftEqualToView(evlblName).topSpaceToView(evlblName,10).rightSpaceToView(contentView,10).autoHeightRatio(0);
    
    evimgWeixinPhotoes.sd_layout.leftEqualToView(evlblName);
    
    evlblTime.sd_layout.leftEqualToView(evlblContent).topSpaceToView(evimgWeixinPhotoes,10).rightSpaceToView(contentView,10).autoHeightRatio(0);
    [self setupAutoHeightWithBottomView:evlblTime bottomMargin:10];
}

- (void)setModel:(DemoVC8DTO *)model{
    evimgHeader.image = [UIImage imageNamed:model.iconName];
    evlblName.text = model.name;
    evlblContent.text = model.content;
    
    evimgWeixinPhotoes.picPathStringsArray = model.picNamesArray;
    CGFloat picContainerTopMargin = 0;
    if (model.picNamesArray.count) {
        picContainerTopMargin = 10;
    }
    evimgWeixinPhotoes.sd_layout.topSpaceToView(evlblContent, picContainerTopMargin);
    evlblTime.text = @"1分钟以前";
}

@end
