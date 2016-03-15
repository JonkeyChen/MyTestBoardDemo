//
//  CircleChartView.m
//  刻度盘_Test
//
//  Created by Tianjian on 16/3/14.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "CircleChartView.h"


#define degreesToRadians(x) (M_PI*(x)/180.0) //把角度转换成PI的方式

@interface CircleChartView ()

@property (strong,nonatomic) UIColor * defalutColor;

@property (strong,nonatomic) CAShapeLayer * progressLayer;

@property (strong,nonatomic) UIColor * startColor;
@property (strong,nonatomic) UIColor * overColor;

@property (assign,nonatomic) CGFloat radious;

@property (assign,nonatomic) CGFloat padding;

@property (assign,nonatomic) CGPoint cornerPoint;

@end

@implementation CircleChartView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.startAngle = 0*M_PI;
        self.endAngle   = 1*M_PI;
        self.defalutColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
        self.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
        
        self.pathWidth = 3;
        self.percent = 0;
        
        self.startColor = [UIColor colorWithRed:91/255.0  green:181/255.0 blue:235/255.0 alpha:1];
        self.overColor  = [UIColor colorWithRed:234/255.0 green:70/255.0  blue:70/255.0  alpha:1];
        
        self.padding = 10;
        
        _radious = (self.frame.size.width-2*self.padding)*0.5;
        _cornerPoint = CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0);
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    //1.设置圆心点（CGPoint）和 圆弧半径 (radius)
    [self test3:_cornerPoint radius:_radious];
}

- (void)test3:(CGPoint)point radius:(CGFloat)radius{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:point radius:radius startAngle:degreesToRadians(-180) endAngle:degreesToRadians(0) clockwise:YES];
    
    //1.圆弧
    CAShapeLayer *trackLayer = [CAShapeLayer layer];
    trackLayer.frame = self.bounds;
    trackLayer.fillColor = [UIColor clearColor].CGColor;
    trackLayer.strokeColor = self.defalutColor.CGColor;
    trackLayer.lineWidth  = self.pathWidth;
    trackLayer.path = path.CGPath;
    [self.layer addSublayer:trackLayer];
    
    //3.渐变色
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.frame = self.bounds;
    _progressLayer.fillColor =  [[UIColor clearColor] CGColor];
    _progressLayer.strokeColor  = [[UIColor purpleColor] CGColor];
    _progressLayer.lineCap = kCALineCapRound;
    _progressLayer.lineWidth = self.pathWidth;
    _progressLayer.path = [path CGPath];
    _progressLayer.strokeEnd = 0;
    
    CALayer *gradientLayer = [CALayer layer];
    CAGradientLayer *gradientLayer1 =  [CAGradientLayer layer];
    gradientLayer1.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [gradientLayer1 setLocations:@[@0.1,@0.5,@0.7]];
    [gradientLayer1 setColors:[NSArray arrayWithObjects:(id)[self.startColor CGColor],(id)[self.overColor CGColor],nil]];
    [gradientLayer1 setStartPoint:CGPointMake(0, 0)];
    [gradientLayer1 setEndPoint:CGPointMake(1,1)];
    [gradientLayer addSublayer:gradientLayer1];
    
    [gradientLayer setMask:_progressLayer]; //用progressLayer来截取渐变层
    [self.layer addSublayer:gradientLayer];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self setPercent:0.8    animated:YES];
    
    UITouch *touch = [[event allTouches]anyObject];
    
    CGPoint point = [touch locationInView:self];
    
    NSLog(@"(%@,%@)",@(point.x),@(point.y));
}

-(void)setPercent:(CGFloat)percent{
    _progressLayer.strokeEnd = percent;
    
    [self addPointWithPercent:percent];
    [self setPercent:percent animated:YES];
}

-(void)setPercent:(CGFloat)percent animated:(BOOL)animated{
    
    [CATransaction begin];
    [CATransaction setDisableActions:!animated];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [CATransaction setAnimationDuration:1];
    _progressLayer.strokeEnd = percent/1.0;
    [CATransaction commit];
    
    [self addPointWithPercent:percent];
}

- (void)addPointWithPercent:(CGFloat)percent{
    if (percent == 0) {
        return;
    }
    
    CGFloat point_x = self.radious*2*percent+self.padding*3;
    CGFloat point_y = sqrtl(self.radious*self.radious - (point_x-self.cornerPoint.x)*(point_x-self.cornerPoint.x))+self.cornerPoint.y;
    NSLog(@"(%@,%@)",@(point_x),@(self.frame.size.height - point_y));
    CGFloat cornerR = self.pathWidth;///2.0;
    
    UIBezierPath *cornerPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(point_x,self.frame.size.height- point_y) radius:cornerR startAngle:-M_PI endAngle:M_PI clockwise:YES];
    CAShapeLayer *backgroundLayer = [CAShapeLayer layer];
    backgroundLayer.path = cornerPath.CGPath;
    backgroundLayer.strokeColor = [UIColor whiteColor].CGColor;
    backgroundLayer.fillColor   = [UIColor whiteColor].CGColor;
    backgroundLayer.lineWidth = 1;
    [self.layer addSublayer:backgroundLayer];
}


/*********************************************************************************************************************************/
- (void)test2:(CGPoint)point radius:(CGFloat)radius{
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:point radius:radius startAngle:0 endAngle:-M_PI clockwise:NO];
    CAShapeLayer *backgroundLayer = [CAShapeLayer layer];
    backgroundLayer.path = path.CGPath;
    backgroundLayer.strokeColor = self.defalutColor.CGColor;
    backgroundLayer.fillColor   = _defalutColor.CGColor;
    backgroundLayer.lineWidth = 2;
    [self.layer addSublayer:backgroundLayer];
    
    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:point radius:radius startAngle:M_PI endAngle:1.5*M_PI clockwise:YES];
    CAShapeLayer *backgroundLayer2 = [CAShapeLayer layer];
    backgroundLayer2.path = path2.CGPath;
    backgroundLayer2.strokeColor = [UIColor redColor].CGColor;
    backgroundLayer2.fillColor   = [UIColor redColor].CGColor;
    backgroundLayer2.lineWidth = 2;
    [self.layer addSublayer:backgroundLayer2];
    
    

    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:point radius:radius-10 startAngle:0 endAngle:-M_PI clockwise:NO];
    CAShapeLayer *backgroundLayer1 = [CAShapeLayer layer];
    backgroundLayer1.path = path1.CGPath;
    backgroundLayer1.strokeColor = [UIColor whiteColor].CGColor;
    backgroundLayer1.fillColor   = [UIColor whiteColor].CGColor;
    backgroundLayer1.lineWidth = 2;
    [self.layer addSublayer:backgroundLayer1];

}

- (void)test1{
    //获取ctx
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    
    //设置画图相关样式参数
    //设置笔触颜色
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);//设置颜色有很多方法，我觉得这个方法最好用
    //设置笔触宽度
    CGContextSetLineWidth(ctx, 2);
    //设置填充色
    CGContextSetFillColorWithColor(ctx, [UIColor purpleColor].CGColor);
    //设置拐点样式
    //    enum CGLineJoin {
    //        kCGLineJoinMiter, //尖的，斜接
    //        kCGLineJoinRound, //圆
    //        kCGLineJoinBevel //斜面
    //    };
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    //Line cap 线的两端的样式
    //    enum CGLineCap {
    //        kCGLineCapButt,
    //        kCGLineCapRound,
    //        kCGLineCapSquare
    //    };
    CGContextSetLineCap(ctx, kCGLineCapRound);
    //虚线线条样式
    //CGFloat lengths[] = {10,10};
    
    //画线
    //[self drawLine:ctx];
    
    //画圆、圆弧
    [self drawCircle:ctx];
    
    
    //画矩形,画椭圆，多边形
    //[self drawShape:ctx];
    
    //画图片
    //[self drawPicture:ctx];
    
    //画文字
    //[self drawText:ctx];
    
}
- (void)drawLine:(CGContextRef)ctx{
    //画一条简单的线
    CGPoint points1[] = {CGPointMake(10, 30),CGPointMake(300, 30)};
    CGContextAddLines(ctx,points1, 2);
    
    
    //画线方法1，使用CGContextAddLineToPoint画线，需要先设置一个起始点
    //设置起始点
    CGContextMoveToPoint(ctx, 50, 50);
    //添加一个点
    CGContextAddLineToPoint(ctx, 100,50);
    //在添加一个点，变成折线
    CGContextAddLineToPoint(ctx, 150, 100);
    
    
    //画线方法2
    //构造线路径的点数组
    CGPoint points2[] = {CGPointMake(60, 60),CGPointMake(80, 120),CGPointMake(20, 300)};
    CGContextAddLines(ctx,points2, 3);
    
    
    //利用路径去画一组点（推荐使用路径的方式，虽然多了几行代码，但是逻辑更清晰了）
    //第一个路径
    CGMutablePathRef path1 = CGPathCreateMutable();
    CGPathMoveToPoint(path1, &CGAffineTransformIdentity, 0, 200);
    //CGAffineTransformIdentity 类似于初始化一些参数
    CGPathAddLineToPoint(path1, &CGAffineTransformIdentity, 100, 250);
    CGPathAddLineToPoint(path1, &CGAffineTransformIdentity, 310, 210);
    //路径1加入context
    CGContextAddPath(ctx, path1);
    //path同样有方法CGPathAddLines(),和CGContextAddLines()差不多用户，可以自己试下
    
    //描出笔触
    CGContextStrokePath(ctx);
}
//画矩形,画椭圆，多边形
-(void)drawSharp:(CGContextRef)ctx{
    
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    
    
    //画椭圆，如果长宽相等就是圆
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 250, 50, 50));
    
    //画矩形,长宽相等就是正方形
    CGContextAddRect(ctx, CGRectMake(70, 250, 50, 50));
    
    
    //画多边形，多边形是通过path完成的
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, &CGAffineTransformIdentity, 120, 250);
    CGPathAddLineToPoint(path, &CGAffineTransformIdentity, 200, 250);
    CGPathAddLineToPoint(path, &CGAffineTransformIdentity, 180, 300);
    CGPathCloseSubpath(path);
    CGContextAddPath(ctx, path);
    
    
    //填充
    CGContextFillPath(ctx);
    
    
}

//画图片
-(void)drawPicture:(CGContextRef)context{
    /*图片*/
    UIImage *image = [UIImage imageNamed:@"head.jpeg"];
    [image drawInRect:CGRectMake(10, 300, 100, 100)];//在坐标中画出图片
}

//画圆、圆弧
-(void)drawCircle:(CGContextRef)ctx{
    
    CALayer *caLayer = [CALayer layer];
    
    
    //1.设置圆心点（CGPoint）和 圆弧半径 (radius)
    CGPoint point  = CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0);
    CGFloat radius = (self.frame.size.width-40)*0.5;

    

    
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    //半圆
    CGContextAddArc(ctx, point.x, point.y, radius, 0, M_PI, 1);
    CGContextStrokePath(ctx);
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor purpleColor].CGColor);
    //半圆
    //CGContextAddArc(ctx, point.x, point.y, radius, 0, M_PI, 1);
    CGContextMoveToPoint(ctx, point.x-radius, point.y);
    CGContextAddArc(ctx, point.x, point.y, radius,  M_PI, M_PI*1.5, 1);
    
    CGContextStrokePath(ctx);

    return;
    CGContextSetStrokeColorWithColor(ctx, [UIColor purpleColor].CGColor);
    
    /* 绘制路径 方法一
     void CGContextAddArc (
     CGContextRef c,
     CGFloat x,             //圆心的x坐标
     CGFloat y,             //圆心的y坐标
     CGFloat radius,        //圆的半径
     CGFloat startAngle,    //开始弧度
     CGFloat endAngle,      //结束弧度
     int clockwise          //0表示顺时针，1表示逆时针
     );
     */
    
    //圆
    CGContextAddArc (ctx, 100, 100, 50, 0, M_PI* 2 , 0);
    CGContextStrokePath(ctx);
    
    //半圆
    CGContextAddArc (ctx, 100, 200, 50, 0, M_PI*2, 0);
    CGContextStrokePath(ctx);
    
    //绘制路径 方法二，这方法适合绘制弧度 ，端点p1和p2是弧线的控制点，类似photeshop中钢笔工具控制曲线，还不明白请去了解贝塞尔曲线
    //    void CGContextAddArcToPoint(
    //                                CGContextRef c,
    //                                CGFloat x1,  //端点1的x坐标
    //                                CGFloat y1,  //端点1的y坐标
    //                                CGFloat x2,  //端点2的x坐标
    //                                CGFloat y2,  //端点2的y坐标
    //                                CGFloat radius //半径
    //                                )；
    
    //1/4弧度 * 4
    CGContextMoveToPoint(ctx, 200, 200);
    CGContextAddArcToPoint(ctx, 200, 100,300, 100, 100);
    CGContextAddArcToPoint(ctx, 400, 100,400, 200, 100);
    CGContextAddArcToPoint(ctx, 400, 300,300, 300, 100);
    CGContextAddArcToPoint(ctx, 200, 300,200, 200, 100);
    CGContextStrokePath(ctx);
    
    //贝塞尔曲线
    CGContextSetStrokeColorWithColor(ctx, [UIColor orangeColor].CGColor);
    
    //三次曲线函数
    //void CGContextAddCurveToPoint (
    //                               CGContextRef c,
    //                               CGFloat cp1x, //控制点1 x坐标
    //                               CGFloat cp1y, //控制点1 y坐标
    //                               CGFloat cp2x, //控制点2 x坐标
    //                               CGFloat cp2y, //控制点2 y坐标
    //                               CGFloat x,  //直线的终点 x坐标
    //                               CGFloat y  //直线的终点 y坐标
    //                               );
    
    CGContextMoveToPoint(ctx, 200, 200);
    CGContextAddCurveToPoint(ctx, 200, 0, 300, 200, 400, 100);
    CGContextStrokePath(ctx);
    
    //三次曲线可以画圆弧，比如这里画一条之前用CGContextAddArcToPoint构成的圆弧
    CGContextMoveToPoint(ctx, 200, 200);
    CGContextAddCurveToPoint(ctx, 200, 100, 300, 100, 300 ,100);
    CGContextStrokePath(ctx);
    //二次曲线函数
    //void CGContextAddQuadCurveToPoint (
    //                                   CGContextRef c,
    //                                   CGFloat cpx,  //控制点 x坐标
    //                                   CGFloat cpy,  //控制点 y坐标
    //                                   CGFloat x,  //直线的终点 x坐标
    //                                   CGFloat y  //直线的终点 y坐标
    //                                   );
    
    CGContextMoveToPoint(ctx, 100, 100);
    CGContextAddQuadCurveToPoint(ctx, 200, 0, 300, 150);
    CGContextStrokePath(ctx);
    
}



@end