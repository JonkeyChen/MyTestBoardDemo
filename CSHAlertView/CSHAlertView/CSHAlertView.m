//
//  CSHAlertView.m
//  CSHAlertView
//
//  Created by 陈胜华 on 15/11/24.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "CSHAlertView.h"

#define kAlertTitleOffSetY 15
#define kAlertTitleHeight  25

#define kDefalutWith   245
#define kDefaultHeight 160

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface CSHAlertView ()

@property (strong,nonatomic) UILabel *evlblAlertTitle;

@property (strong,nonatomic) UILabel *evlblContent;

@property (strong,nonatomic) UIButton *evbtnLeft;

@property (strong,nonatomic) UIButton *evbtnRight;

@property (strong,nonatomic) UIView *backContentView;

@end

@implementation CSHAlertView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

- (id)initTitle:(NSString*)title content:(NSString*)content leftAction:(efOnClickLeft)left rightAction:(efOnClickRight)right{
    if (self = [super init]) {
        [[self evlblAlertTitle] setText:title];
    }
    return self;
}

- (void)show{

    self.frame = CGRectMake((ScreenHeight-kDefalutWith)/2.0, (ScreenHeight-kDefaultHeight)/2.0, kDefalutWith, kDefaultHeight);
    [[self _efGetRootViewController].view addSubview:self];
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    
    if (newSuperview == nil) {
        return;
    }
    
    [[self _efGetRootViewController].view addSubview:[self backContentView]];
    
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = 0.4;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    popAnimation.keyTimes = @[@0.2f, @0.5f, @0.75f, @1.0f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [self.layer addAnimation:popAnimation forKey:nil];
    
    self.frame = CGRectMake((ScreenHeight-kDefalutWith)/2.0, (ScreenHeight-kDefaultHeight)/2.0, kDefalutWith, kDefaultHeight);
}

- (UIViewController*)_efGetRootViewController{
    UIViewController *rootCtr = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (rootCtr.presentedViewController) {
        rootCtr = rootCtr.presentedViewController;
    }
    return rootCtr;
}

- (UILabel *)evlblAlertTitle{
    if (!_evlblAlertTitle) {
        _evlblAlertTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, kAlertTitleOffSetY, kDefalutWith, kAlertTitleHeight)];
        _evlblAlertTitle.font = [UIFont systemFontOfSize:20];
        _evlblAlertTitle.textColor = [UIColor colorWithRed:56.0/255.0 green:64.0/255.0 blue:71.0/255.0 alpha:1];
        [self addSubview:_evlblAlertTitle];
    }
    return _evlblAlertTitle;
}

- (UIView *)backContentView{
    if (!_backContentView) {
        _backContentView = [[UIView alloc]initWithFrame:[self _efGetRootViewController].view.bounds];
        _backContentView.backgroundColor = [UIColor blackColor];
        _backContentView.alpha = 0.5;
        _backContentView.autoresizesSubviews = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    }
    return _backContentView;
}

@end
