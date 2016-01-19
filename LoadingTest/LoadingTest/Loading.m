//
//  Loading.m
//  LoadingTest
//
//  Created by Tianjian on 15/11/20.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "Loading.h"

@interface Loading ()

@property (strong,nonatomic) UIView *contentView;

@end

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeigt [UIScreen mainScreen].bounds.size.height


@implementation Loading

+ (void)showLoading{
    UIView *loadingView = [UIView new];
    loadingView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeigt);
    loadingView.backgroundColor = [UIColor redColor];
    [[UIApplication sharedApplication].keyWindow addSubview:loadingView];
}

+ (void)dismiss{

}

- (UIView *)contentView{
    if (_contentView) {
        _contentView = [[UIView alloc]init];
        _contentView.backgroundColor = [UIColor redColor];
    }
    return _contentView;
}



@end
