//
//  ViewController.m
//  CALayer01
//
//  Created by Tianjian on 15/11/26.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "ViewController.h"
#import "CALayer+ChangeColor.h"
#import "CALayerView.h"

@interface ViewController ()

@property (nonatomic, assign)CGRect  ovalRect;
@property (nonatomic, assign)int lineWidth;
@property (nonatomic, strong) UIColor *colorLine;

@property (nonatomic, strong) CALayerView *calayerView;

@end
#define PHOTO_HEIGHT 150

@implementation ViewController
@synthesize ovalRect,lineWidth,colorLine,calayerView;


- (void)viewDidLoad{
    [super viewDidLoad];
    
    UIView *showView = [[UIView alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width-40, 300)];
    [self.view addSubview:showView];
    showView.backgroundColor = [UIColor redColor];
    showView.alpha = 0.5;
    
    //自定义图层
    CALayer *bgLayer=[[CALayer alloc]init];
    bgLayer.bounds = showView.bounds;
    bgLayer.backgroundColor = [UIColor darkGrayColor].CGColor;
    bgLayer.opacity = 0.5;
    bgLayer.anchorPoint = CGPointMake(0, 0);
    bgLayer.masksToBounds=YES;
    [bgLayer addChangeColors:@[(id)[UIColor redColor].CGColor,(id)[UIColor yellowColor].CGColor,(id)[UIColor greenColor].CGColor]];
    [showView.layer addSublayer:bgLayer];

    // 创建layer并设置属性
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor clearColor].CGColor;//闭环填充颜色
    layer.strokeColor = [UIColor greenColor].CGColor;//边缘颜色
    layer.lineWidth = 1;
    layer.lineCap = kCALineCapRound; //边缘线类型
    layer.lineJoin = kCALineJoinRound;//
    [showView.layer addSublayer:layer];
    
    // 创建贝塞尔路径~
    CGFloat pointPadding = (showView.frame.size.width-50)/5;
    CGFloat pointWidth   = 10;
    CGFloat pointCutDown = pointWidth*sin(60/180.0*M_PI);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    for (int i = 0; i<7; i++) {
        CGFloat pointCenterX = pointPadding*i+pointWidth;
        CGFloat pointCenterY = tan(60/180.0*M_PI)*(i%2)*pointPadding+pointWidth;
        
        [path addLineToPoint:CGPointMake(pointCenterX-pointCutDown, pointCenterY-pointCutDown)];
        //[path appendPath:[UIBezierPath
        //                  bezierPathWithArcCenter:CGPointMake(pointCenterX,pointCenterY)
        //                  radius          :pointWidth
        //                  startAngle      :0
        //                  endAngle        :pointWidth* M_PI
        //                  clockwise       :YES]];
        //[path addLineToPoint:CGPointMake(pointCenterX+pointCutDown, pointCenterY-pointCutDown)];
        //[path moveToPoint:CGPointMake(pointCenterX+pointCutDown, pointCenterY-pointCutDown)];
    }
    
    // 关联layer和贝塞尔路径~
    layer.path = path.CGPath;
    
    // 创建Animation
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(0.0);
    animation.toValue = @(1.0);
    layer.autoreverses = NO;
    animation.duration = 1.0;
    // 设置layer的animation
    //animation.removedOnCompletion = YES;
    [layer addAnimation:animation forKey:nil];
    // 第一种设置动画完成,不移除结果的方法
    //animation.fillMode = kCAFillModeForwards;
    //animation.removedOnCompletion = NO;
    
    // 第二种
    //layer.strokeEnd = 1;
    
    return;
    // 创建一个gradientLayer
    CAGradientLayer *gradientLayer =  [CAGradientLayer layer];
    gradientLayer.frame = showView.bounds;
    [gradientLayer setColors:[NSArray arrayWithObjects:
                              (id)[[UIColor redColor] CGColor],
                              (id)[[UIColor yellowColor] CGColor],
                              (id)[[UIColor greenColor] CGColor],nil]];
    [gradientLayer setLocations:@[@0.5,@0.9,@1]];
    [gradientLayer setStartPoint:CGPointMake(0.5, 1)];
    [gradientLayer setEndPoint:CGPointMake(0.5, 0)];
    
    return;
    
    calayerView = [[CALayerView alloc]initWithFrame:CGRectMake(20, 20, 200, 100)];
    calayerView.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:calayerView];
    [calayerView.layer setNeedsDisplay];
    
    return;
    CGContextRef content = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(content, 1, 0, 0, 1);
    CGContextFillRect(content, CGRectMake(2, 2, 100, 100));
    CGContextStrokePath(content);
}

- (void)ShareLayerFirst{
    
//    calayerView = [[CALayerView alloc]initWithFrame:CGRectMake(20, 20, 200, 100)];
//    [calayerView.layer setNeedsDisplay];
//    return;
//    
//    [self drawLine];
//    return;
    
    ovalRect = CGRectMake(0, 0, PHOTO_HEIGHT, PHOTO_HEIGHT);
    lineWidth = 2;
    colorLine = [UIColor orangeColor];
    
    //自定义图层
    CALayer *layer=[[CALayer alloc]init];
    layer.bounds=CGRectMake(0, 0, PHOTO_HEIGHT, PHOTO_HEIGHT);
    layer.backgroundColor = [UIColor darkGrayColor].CGColor;
    layer.opacity = 0.5;
    layer.position=CGPointMake(100, 100);
    layer.cornerRadius = 5;//PHOTO_HEIGHT/2;
    layer.masksToBounds=YES;
    [layer addChangeColors:@[(id)[UIColor redColor].CGColor,(id)[UIColor yellowColor].CGColor,(id)[UIColor yellowColor].CGColor]];
    [self.view.layer addSublayer:layer];

    
    for (int i = 0; i< 3; i++) {
        CAShapeLayer *shaperLayerLine = [[CAShapeLayer alloc]init];
        shaperLayerLine.bounds = CGRectMake(0, layer.frame.size.height/3.0*i, layer.frame.size.width, 1);
        shaperLayerLine.anchorPoint = CGPointZero;
        [shaperLayerLine setFillColor:[UIColor yellowColor].CGColor];
        [shaperLayerLine setStrokeColor:[UIColor greenColor].CGColor];
        [layer addSublayer:shaperLayerLine];
    }

    
    CALayer *layer1=[[CALayer alloc]init];
    layer1.bounds= layer.bounds;
    layer1.anchorPoint = CGPointZero;
    layer1.delegate = self;
    [layer addSublayer:layer1];

    [layer1 setNeedsDisplay];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)theContext{
    UIBezierPath* ovalPath = [UIBezierPath bezierPath];
    //[ovalPath addArcWithCenter: CGPointMake(CGRectGetMidX(self.ovalRect), CGRectGetMidY(self.ovalRect)) radius: CGRectGetWidth(self.ovalRect) / 2 startAngle: 195 * M_PI/180 endAngle: 255 * M_PI/180 clockwise: YES];
    
    
    [ovalPath moveToPoint: CGPointMake(0, 0)];
    [ovalPath addLineToPoint:CGPointMake(50, 50)];
    [ovalPath addLineToPoint:CGPointMake(100, 0)];
    [ovalPath addLineToPoint:CGPointMake(150, 50)];
    
    CGContextAddPath(theContext, ovalPath.CGPath);
    
    CGContextSetLineWidth(theContext,self.lineWidth);
    CGContextSetStrokeColorWithColor(theContext, [UIColor yellowColor].CGColor);
    CGContextStrokePath(theContext);
    
    CABasicAnimation *ani = [ CABasicAnimation animationWithKeyPath : NSStringFromSelector ( @selector (strokeEnd))];
    ani. fromValue = @0 ;
    ani. toValue = @1 ;
    ani. duration = 5 ;
    [layer addAnimation :ani forKey : NSStringFromSelector ( @selector (strokeEnd))];
    
    return;
    
    //// Oval 2 Drawing
    UIBezierPath* oval2Path = [UIBezierPath bezierPath];
    [oval2Path addArcWithCenter: CGPointMake(CGRectGetMidX(self.ovalRect), CGRectGetMidY(self.ovalRect)) radius: CGRectGetWidth(self.ovalRect) / 2 startAngle: 285 * M_PI/180 endAngle: 345 * M_PI/180 clockwise: YES];
    CGContextAddPath(theContext, oval2Path.CGPath);
    //
    // Oval 3 Drawing
    UIBezierPath* oval3Path = [UIBezierPath bezierPath];
    [oval3Path addArcWithCenter: CGPointMake(CGRectGetMidX(self.ovalRect), CGRectGetMidY(self.ovalRect)) radius: CGRectGetWidth(self.ovalRect) / 2 startAngle: 15 * M_PI/180 endAngle: 75 * M_PI/180 clockwise: YES];
    CGContextAddPath(theContext, oval3Path.CGPath);
    //
    //    //// Oval 4 Drawing
    UIBezierPath* oval4Path = [UIBezierPath bezierPath];
    [oval4Path addArcWithCenter: CGPointMake(CGRectGetMidX(self.ovalRect), CGRectGetMidY(self.ovalRect)) radius: CGRectGetWidth(self.ovalRect) / 2 startAngle: 105 * M_PI/180 endAngle: 165 * M_PI/180 clockwise: YES];
    CGContextAddPath(theContext, oval4Path.CGPath);
    
    CGContextSetLineWidth(theContext,self.lineWidth);
    CGContextSetStrokeColorWithColor(theContext, self.colorLine.CGColor);
    CGContextStrokePath(theContext);
}

- ( void )drawLine{
    //view 是曲线的背景 view
    UIView *view = [[ UIView alloc ] initWithFrame : CGRectMake ( 10 , 0 , 300 , 300 )];
    view. backgroundColor = [ UIColor whiteColor ];
    [self.view addSubview :view];
    
    // 第一、 UIBezierPath 绘制线段
    UIBezierPath *firstPath = [ UIBezierPath bezierPathWithOvalInRect : CGRectMake ( 0 , 0 , 5 , 5 )];
    CGPoint p1 = CGPointMake ( 0 , 0 );
    CGPoint p2 = CGPointMake ( 300 , 0 );
    
    [firstPath addLineToPoint :p1];
    [firstPath addLineToPoint :p2];
    
    UIBezierPath *lastPath = [ UIBezierPath bezierPathWithOvalInRect : CGRectMake ( 300 , 0 , 0 , 0 )];
    [firstPath appendPath :lastPath];
    
    
    // 第二、 UIBezierPath 和 CAShapeLayer 关联
    
    CAShapeLayer *lineLayer2 = [ CAShapeLayer layer ];
    lineLayer2. frame = CGRectMake ( 0 , 50 , 320 , 40 );
    lineLayer2. fillColor = [ UIColor yellowColor ]. CGColor ;
    lineLayer2. path = firstPath. CGPath ;
    lineLayer2. strokeColor = [ UIColor redColor ]. CGColor ;
    
    //第三，动画
    
    CABasicAnimation *ani = [ CABasicAnimation animationWithKeyPath : NSStringFromSelector ( @selector (strokeEnd))];
    ani. fromValue = @0 ;
    ani. toValue = @1 ;
    ani. duration = 5 ;
    [lineLayer2 addAnimation :ani forKey : NSStringFromSelector ( @selector (strokeEnd))];
    [view. layer addSublayer :lineLayer2];
    
}
- (void)strokeEnd{
    NSLog(@"xxxx");
}

@end
