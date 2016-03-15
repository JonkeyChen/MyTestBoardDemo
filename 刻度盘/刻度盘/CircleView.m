//
//  CircleView.m
//  YaoYD
//
//  Created by Tianjian on 16/3/15.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "CircleView.h"

@interface CircleView ()

@property (strong,nonatomic) UIColor * conduitColor;//管道默认背景颜色
@property (strong,nonatomic) UIColor * startColor;
@property (strong,nonatomic) UIColor * overColor;
@property (strong,nonatomic) NSArray<UIColor*> *colorArray;//渐变颜色值

@property (assign,nonatomic) CGPoint originPoint;  //圆心点
@property (assign,nonatomic) CGFloat radious;      //大圆弧半径
@property (assign,nonatomic) CGFloat bottomPadding;//距底部距离
@property (assign,nonatomic) CGFloat leftPadding;  //距左侧距离
@property (assign,nonatomic) CGFloat conduitWidth; //管道宽度

@property (strong,nonatomic) CAShapeLayer * progressLayer;
@property (strong,nonatomic) UIBezierPath * conduitPath;
@property (strong,nonatomic) UIBezierPath * pointPath;
@property (strong,nonatomic) UIView       * pointView;

@end

#define degreesToRadians(x) (M_PI*(x)/180.0) //把角度转换成PI的方式

@implementation CircleView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

        [self configureUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self configureUI];
    }
    return self;
}

- (void)configureUI{
    self.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
    self.conduitColor    = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    self.startColor      = [UIColor colorWithRed:91/255.0  green:181/255.0 blue:235/255.0 alpha:1];
    self.overColor       = [UIColor colorWithRed:234/255.0 green:70/255.0  blue:70/255.0  alpha:1];
    self.colorArray      = @[(id)[[UIColor redColor]    CGColor],
                             (id)[[UIColor grayColor]   CGColor],
                             (id)[[UIColor greenColor]  CGColor],
                             (id)[[UIColor yellowColor] CGColor],
                             (id)[[UIColor purpleColor] CGColor],];
    
    self.conduitWidth  = 10;
    self.leftPadding   = 10;
    self.bottomPadding = 0;
    
    self.radious     = self.frame.size.width*0.5 - self.leftPadding - self.conduitWidth*0.5;
    self.originPoint = CGPointMake(self.frame.size.width*0.5-self.leftPadding, self.frame.size.height-self.bottomPadding);
    self.conduitPath = [UIBezierPath bezierPathWithArcCenter:self.originPoint
                                                      radius:self.radious
                                                  startAngle:degreesToRadians(-180)
                                                    endAngle:degreesToRadians(0)
                                                   clockwise:YES];
    
    self.pointView = [[UIView alloc]init];
    self.pointView.frame = CGRectMake(self.originPoint.x-self.radious-self.conduitWidth*0.5, self.originPoint.y, self.conduitWidth+2, self.conduitWidth+2);
    self.pointView.layer.masksToBounds = YES;
    self.pointView.layer.cornerRadius  = self.conduitWidth*0.5+1;
    self.pointView.backgroundColor = [UIColor whiteColor];
}

- (void)setPercentPI:(CGFloat)percentPI{
    _percentPI = percentPI;
    [self.pointView removeFromSuperview];
    _progressLayer.strokeEnd = 0;
    
    self.pointPath = [UIBezierPath bezierPathWithArcCenter:self.originPoint radius:self.radious startAngle:-M_PI endAngle:-(M_PI - degreesToRadians(percentPI)) clockwise:YES];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self addSubview:self.pointView];
        
        [CATransaction begin];
        [CATransaction setDisableActions:NO];
        [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
        [CATransaction setAnimationDuration:1];
        _progressLayer.strokeEnd   = percentPI/180.0;
        [CATransaction commit];
        
        CAKeyframeAnimation *keyframeAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
        keyframeAnimation.path = self.pointPath.CGPath;
        keyframeAnimation.repeatCount=0;
        keyframeAnimation.removedOnCompletion = NO;
        keyframeAnimation.fillMode = kCAFillModeForwards;
        keyframeAnimation.duration = 1;
        keyframeAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        keyframeAnimation.delegate=self;
        [self.pointView.layer addAnimation:keyframeAnimation forKey:nil];
    });
}


- (void)drawRect:(CGRect)rect {
    [self drawCircle:self.originPoint radius:self.radious];
}
- (void)drawCircle:(CGPoint)circlePoint radius:(CGFloat)radius{
    //1.圆弧
    CAShapeLayer *trackLayer = [CAShapeLayer layer];
    trackLayer.frame         = self.bounds;
    trackLayer.fillColor     = [UIColor clearColor].CGColor;
    trackLayer.strokeColor   = self.conduitColor.CGColor;
    trackLayer.lineWidth     = self.conduitWidth;
    trackLayer.path          = self.conduitPath.CGPath;
    [self.layer addSublayer:trackLayer];
    
    //3.渐变色
    _progressLayer             = [CAShapeLayer layer];
    _progressLayer.frame       = self.bounds;
    _progressLayer.fillColor   = [[UIColor clearColor] CGColor];
    _progressLayer.strokeColor = [[UIColor purpleColor] CGColor];
    _progressLayer.lineCap     = kCALineCapRound;
    _progressLayer.lineWidth   = self.conduitWidth;
    _progressLayer.path        = [self.conduitPath CGPath];
    _progressLayer.strokeEnd   = 0;
    
    CALayer *gradientLayer = [CALayer layer];
    
    CAGradientLayer *gradientLayer1 =  [CAGradientLayer layer];
    gradientLayer1.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    //[gradientLayer1 setLocations:@[@0.5]];
    [gradientLayer1 setColors:[NSArray arrayWithObjects:(id)[self.startColor CGColor],(id)[self.overColor CGColor],(id)[self.startColor CGColor],(id)[self.overColor CGColor],nil]];
    [gradientLayer1 setStartPoint:CGPointMake(0, 0)];
    [gradientLayer1 setEndPoint:CGPointMake(1,1)];
    [gradientLayer addSublayer:gradientLayer1];
    
    [gradientLayer setMask:_progressLayer]; //用progressLayer来截取渐变层
    [self.layer addSublayer:gradientLayer];
    
}

@end
