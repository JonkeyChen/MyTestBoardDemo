




//
//  CALayerView.m
//  CALayer01
//
//  Created by Tianjian on 15/11/26.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "CALayerView.h"

@implementation CALayerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self){
        layer = [CAShapeLayer layer];
        layer.frame = self.bounds;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.height / 2.0f,
                                                                               self.frame.size.height / 2.0f)
                                                            radius:self.frame.size.height / 2.f
                                                        startAngle:0
                                                          endAngle:M_PI * 2
                                                         clockwise:YES];
        
        layer.strokeColor   = [UIColor greenColor].CGColor;   // 边缘线的颜色
        layer.fillColor     = [UIColor clearColor].CGColor;   // 闭环填充的颜色
        layer.lineCap       = kCALineCapSquare;               // 边缘线的类型
        layer.path          = path.CGPath;                    // 从贝塞尔曲线获取到形状
        layer.lineWidth     = 1.0f;                           // 线条宽度
        layer.strokeStart   = 0.0f;
        layer.strokeEnd     = 0.0f;
        
        [self.layer addSublayer:layer];
    }
    return self;
}

- (void)strokeStart:(CGFloat)value
{
    layer.speed = 1;
    layer.strokeStart = value;
}

- (void)strokeEnd:(CGFloat)value
{
    layer.speed = 1;
    layer.strokeEnd = value;
}
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    
    return;
    CGContextSetRGBStrokeColor(ctx, 1, 1, 1, 1);//线条颜色
    CGContextSetRGBFillColor(ctx, 0, 1, 0, 1);//填充颜色
    CGContextSetLineWidth(ctx, 1);
    
    CGPoint aPoints2[5];
    aPoints2[0] =CGPointMake(0+5,5);
    aPoints2[1] =CGPointMake(60+5,60+5);
    aPoints2[2] =CGPointMake(60+5,0+5);
    aPoints2[3] =CGPointMake(120+5,60+5);
    aPoints2[4] =CGPointMake(120+5,0+5);
    
    CGFloat width = 10;
    for (int i = 0; i < 5; i++) {
        CGPoint point = aPoints2[i];
        CGRect aRect = CGRectMake(point.x-width/2.0, point.y-width/2.0, width, width);
        CGContextAddEllipseInRect(ctx, aRect);
        CGContextDrawPath(ctx, kCGPathStroke);
    }
    return;
    CGPoint aPoints[5];
    aPoints[0] =CGPointMake(0,0);
    aPoints[1] =CGPointMake(60,60);
    aPoints[2] =CGPointMake(60,0);
    aPoints[3] =CGPointMake(120,60);
    aPoints[4] =CGPointMake(120,0);
    CGContextAddLines(ctx, aPoints , 5);
    CGContextDrawPath(ctx, kCGPathStroke);

    CGPoint aPoints1[5];
    aPoints1[0] =CGPointMake(0,0+60);
    aPoints1[1] =CGPointMake(60,60+60);
    aPoints1[2] =CGPointMake(60,0+60);
    aPoints1[3] =CGPointMake(120,60+60);
    aPoints1[4] =CGPointMake(120,0+60);
    CGContextAddLines(ctx, aPoints1 , 5);
    CGContextDrawPath(ctx, kCGPathStroke);
    return;
    //线条
    for (int i = 0; i< 3; i++) {
        CGPoint points[2] ;
        points[0] = CGPointMake(0, self.frame.size.height/3.0*i);
        points[1] = CGPointMake(self.frame.size.width, self.frame.size.height/3.0*i);
        CGContextAddLines(ctx, points , 2);
        CGContextDrawPath(ctx, kCGPathStroke);
    }

    return;
    // 第一、 UIBezierPath 绘制线段
    UIBezierPath *firstPath = [ UIBezierPath bezierPathWithOvalInRect : CGRectMake ( 0 , 0 , 5 , 5 )];
    [firstPath addLineToPoint:CGPointMake (0 , 0 )];
    [firstPath addLineToPoint:CGPointMake (self.frame.size.width, 0 )];

    // 第二、 UIBezierPath 和 CAShapeLayer 关联
    CAShapeLayer *lineLayer2 = [ CAShapeLayer layer ];
    lineLayer2. frame = CGRectMake (0, 50 , self.frame.size.width ,40 );
    lineLayer2. fillColor = [ UIColor yellowColor]. CGColor ;
    lineLayer2. path = firstPath. CGPath ;
    lineLayer2. strokeColor = [ UIColor redColor]. CGColor ;

    //第三，动画
    CABasicAnimation *ani = [ CABasicAnimation animationWithKeyPath : NSStringFromSelector ( @selector (strokeEnd))];
    ani. fromValue = @0 ;
    ani. toValue = @1 ;
    ani. duration = 5 ;
    [lineLayer2 addAnimation :ani forKey : NSStringFromSelector ( @selector (strokeEnd))];
    [self.layer addSublayer :lineLayer2];
}


@end
