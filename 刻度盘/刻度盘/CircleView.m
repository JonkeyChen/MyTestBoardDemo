//
//  CircleView.m
//  刻度盘
//
//  Created by Tianjian on 16/3/14.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "CircleView.h"

#define degreesToRadians(x) (M_PI*(x)/180.0) //把角度转换成PI的方式
#define  PROGREESS_WIDTH 80 //圆直径
#define PROGRESS_LINE_WIDTH 4 //弧线的宽度
#define MAIN_SCREEN_ANIMATION_TIME 1

#define UIColorFromRGB [UIColor purpleColor]
#define MAIN_BLUE [UIColor blueColor]
@interface CircleView ()

@property (strong,nonatomic) UIColor *strokeColor;

@property (strong,nonatomic) UIColor *PROCESS_COLOR;

@property (strong,nonatomic) CAShapeLayer *trackLayer;

@property (strong,nonatomic) CAShapeLayer *progressLayer;

@property (assign,nonatomic) CGFloat width;

@property (assign,nonatomic) CGFloat height;



@end

@implementation CircleView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
        
        self.strokeColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
        self.PROCESS_COLOR = [UIColor yellowColor];
        
        self.width = self.frame.size.width;
        self.height = self.frame.size.height;
        
        _percent = 0;
    }
    return self;
}


- (void)drawRect:(CGRect)rect {

    [self test];
}

- (void)test{
    _trackLayer = [CAShapeLayer layer];//创建一个track shape layer
    _trackLayer.frame = self.bounds;
    [self.layer addSublayer:_trackLayer];
    _trackLayer.fillColor = [[UIColor clearColor] CGColor];
    _trackLayer.strokeColor = [_strokeColor CGColor];//指定path的渲染颜色
    _trackLayer.opacity = 0.25; //背景同学你就甘心做背景吧，不要太明显了，透明度小一点
    _trackLayer.lineCap = kCALineCapRound;//指定线的边缘是圆的
    _trackLayer.lineWidth = PROGRESS_LINE_WIDTH;//线的宽度
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(40, 40) radius:(PROGREESS_WIDTH-PROGRESS_LINE_WIDTH)/2 startAngle:degreesToRadians(-180) endAngle:degreesToRadians(0) clockwise:YES];//上面说明过了用来构建圆形
    _trackLayer.path =[path CGPath]; //把path传递給layer，然后layer会处理相应的渲染，整个逻辑和CoreGraph是一致的。
    
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.frame = self.bounds;
    _progressLayer.fillColor =  [[UIColor clearColor] CGColor];
    _progressLayer.strokeColor  = [_PROCESS_COLOR CGColor];
    _progressLayer.lineCap = kCALineCapRound;
    _progressLayer.lineWidth = PROGRESS_LINE_WIDTH;
    _progressLayer.path = [path CGPath];
    _progressLayer.strokeEnd = 0;
    
    CALayer *gradientLayer = [CALayer layer];
    CAGradientLayer *gradientLayer1 =  [CAGradientLayer layer];
    gradientLayer1.frame = CGRectMake(0, 0, self.width/2, self.height);
    [gradientLayer1 setColors:[NSArray arrayWithObjects:(id)[[UIColor redColor] CGColor],(id)[UIColorFromRGB CGColor], nil]];
    [gradientLayer1 setLocations:@[@0.5,@0.9,@1 ]];
    [gradientLayer1 setStartPoint:CGPointMake(0.5, 1)];
    [gradientLayer1 setEndPoint:CGPointMake(0.5, 0)];
    [gradientLayer addSublayer:gradientLayer1];
    
    CAGradientLayer *gradientLayer2 =  [CAGradientLayer layer];
    [gradientLayer2 setLocations:@[@0.1,@0.5,@1]];
    gradientLayer2.frame = CGRectMake(self.width/2, 0, self.width/2, self.height);
    [gradientLayer2 setColors:[NSArray arrayWithObjects:(id)[UIColorFromRGB CGColor],(id)[MAIN_BLUE CGColor], nil]];
    [gradientLayer2 setStartPoint:CGPointMake(0, 0)];
    [gradientLayer2 setEndPoint:CGPointMake(1, 1)];
    [gradientLayer addSublayer:gradientLayer2];
    
    [gradientLayer setMask:_progressLayer]; //用progressLayer来截取渐变层
    [self.layer addSublayer:gradientLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self setPercent:1 animated:YES];
}

-(void)setPercent:(NSInteger)percent animated:(BOOL)animated
{
    [CATransaction begin];
    [CATransaction setDisableActions:!animated];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [CATransaction setAnimationDuration:MAIN_SCREEN_ANIMATION_TIME];
    _progressLayer.strokeEnd = percent/1.0;
    [CATransaction commit];
    
    _percent = percent;
}

@end
