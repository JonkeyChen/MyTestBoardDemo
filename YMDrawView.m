//
//  YMDrawView.m
//  Second
//
//  Created by YM on 15/11/18.
//  Copyright © 2015年 YM. All rights reserved.
//

#import "YMDrawView.h"
#import "UIView+Intercept.h"


#define kLineWidth (0.5)
#define kWordSpace (20)

//小字体
#define kSmallFont  ([UIFont systemFontOfSize:14])
//大字体
#define kBigFont    ([UIFont systemFontOfSize:14])

@interface YMDrawView ()
{
    BOOL isFirstCreate;
}

@end
@implementation YMDrawView


- (void)awakeFromNib{
    isFirstCreate = YES;
}
- (void)layoutSubviews{
    if (isFirstCreate) {
        [self prepareData];
        [self prepareLayer];
        [self prepareAction];
        
    }
    isFirstCreate = NO;

    [self showInfo];
}


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)prepareData{
    _coordinateAxisLineWidth    = kLineWidth;
    _xCoordinateSpace           = kWordSpace;
    _yCoordinateSpace           = kWordSpace;
    _bigFont                    = kBigFont;
    _smallFont                  = kSmallFont;
    _refractLineWidth           = 2;
    _refractLineRadius          = _refractLineWidth;
    _showFrame                  = CGRectMake(20, 20, CGRectGetWidth(self.frame) - 20*2, CGRectGetHeight(self.frame) - 20*2);
    _duration                   = 2;
    _isAnimated                 = YES;
}

- (void)prepareLayer{
    self.layer.cornerRadius     = 15;
    self.layer.masksToBounds    = YES;
    [self addBackgroundLayer];
    [self addTopLineLayer];
    [self addMiddleLineLayer];
    [self addBottomLineLayer];
}

- (void)prepareAction{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClicked:)];
    [self addGestureRecognizer:tap];
}



/**添加背景Layer*/
- (void)addBackgroundLayer{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    gradient.colors = [NSArray arrayWithObjects:
                       (id)[UIColor yellowColor].CGColor,
                       (id)[UIColor redColor].CGColor,
                       nil];
    [self.layer insertSublayer:gradient atIndex:0];
}

/**添加上部线条Layer*/
- (void)addTopLineLayer{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = _showFrame;
    [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    [shapeLayer setStrokeColor:[[UIColor yellowColor] CGColor]];
    [shapeLayer setLineWidth:_coordinateAxisLineWidth];
    [shapeLayer setLineJoin:kCALineJoinRound];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(_showFrame),0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    [[self layer] addSublayer:shapeLayer];
}

/**添加中部线条Layer*/
- (void)addMiddleLineLayer{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = _showFrame;
    [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    [shapeLayer setStrokeColor:[[UIColor yellowColor] CGColor]];
    [shapeLayer setLineWidth:_coordinateAxisLineWidth];
    [shapeLayer setLineJoin:kCALineJoinRound];
    [shapeLayer setLineDashPattern:
     [NSArray arrayWithObjects:[NSNumber numberWithInt:10],[NSNumber numberWithInt:10],nil]];
    // Setup the path
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, CGRectGetHeight(_showFrame)/2- _coordinateAxisLineWidth/2);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(_showFrame),CGRectGetHeight(_showFrame)/2- _coordinateAxisLineWidth/2);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    [[self layer] addSublayer:shapeLayer];
}

/**添加底部线条Layer*/
- (void)addBottomLineLayer{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = _showFrame;
    [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    [shapeLayer setStrokeColor:[[UIColor yellowColor] CGColor]];
    [shapeLayer setLineWidth:_coordinateAxisLineWidth];
    [shapeLayer setLineJoin:kCALineJoinRound];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, CGRectGetHeight(_showFrame)-_coordinateAxisLineWidth);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(_showFrame),CGRectGetHeight(_showFrame)-_coordinateAxisLineWidth);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    [[self layer] addSublayer:shapeLayer];
}
/**折线图Layer*/
- (void)showLayer{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = _showFrame;
    
    [shapeLayer setAccessibilityActivationPoint:CGPointMake(0, 0)];
    [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    [shapeLayer setStrokeColor:[[UIColor whiteColor] CGColor]];
    [shapeLayer setLineWidth:_refractLineWidth];
    [shapeLayer setLineJoin:kCALineJoinRound];
    
    refractLineLayer = shapeLayer;
    [[self layer] addSublayer:refractLineLayer];
    
    /**动画*/
    if (_isAnimated) {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:NSStringFromSelector(@selector(strokeEnd))];
        animation.fromValue = @0.0;
        animation.toValue = @1.0;
        animation.delegate = self;
        animation.duration = _duration;
        [shapeLayer addAnimation:animation forKey:NSStringFromSelector(@selector(strokeEnd))];
    }
    
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(0, 0)];
    CGFloat r = _refractLineRadius;

    
    CGFloat xPoint = 50;
    CGFloat yPoint = CGRectGetHeight(shapeLayer.frame)/2-20;
    CGFloat lastXPoint = xPoint+1;
    CGFloat lastYPoint = yPoint;
    for (int i = 0;  i < 10; i++) {
        
        //   X Y 差值
        CGFloat tempXPoint = ( xPoint - lastXPoint);
        CGFloat tempYPoint = ( yPoint - lastYPoint);
        
        CGFloat sign = (tempYPoint > 0)?1:-1;

        // 圆的差值
        CGFloat tempCircleX = fabs(r*sin(atan(tempXPoint/tempYPoint)));
        CGFloat tempCircleY = fabs(r*sin(atan(tempYPoint/tempXPoint)));
        //要画的圆的圆心
        CGFloat xCententP = xPoint + tempCircleX;
        CGFloat yCententP = yPoint + tempCircleY;
        //开始的起点
        CGFloat xStartP = lastXPoint + tempCircleX;
        CGFloat yStartP = lastYPoint + tempCircleY*sign;
        //截止点
        CGFloat xEndP = xCententP - tempCircleX;
        CGFloat yEndP = yCententP - tempCircleY*(sign);
       
        /**文字Layer*/
        CATextLayer * textLayer = [CATextLayer layer];
        NSString * text = [@(i+10) stringValue];
        
        
        NSMutableParagraphStyle* paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
        NSDictionary* dic = @{NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size : 10 ],
                              NSParagraphStyleAttributeName :paragraphStyle,
                              NSForegroundColorAttributeName:[UIColor whiteColor],
                              NSBackgroundColorAttributeName:[UIColor blackColor]
                              };
        
        NSAttributedString *attributeString = [[NSAttributedString alloc] initWithString:text attributes:dic];
        textLayer.fontSize = 10;
        textLayer.string = text;
        textLayer.contentsScale = 2;
        textLayer.alignmentMode = @"center";
        textLayer.foregroundColor = [UIColor blueColor].CGColor;
        CGRect bounds;
        bounds.origin = CGPointMake(0, 0);
        bounds.size = attributeString.size;
        textLayer.bounds = bounds;
        textLayer.position = CGPointMake(xCententP,yCententP-15);
        [refractLineLayer addSublayer:textLayer];
        
        
        
        
        [bezierPath moveToPoint:CGPointMake(xStartP,yStartP)];
        [bezierPath addLineToPoint:CGPointMake(xEndP, yEndP)];
        [bezierPath appendPath:[UIBezierPath
                                bezierPathWithArcCenter:CGPointMake(xCententP,yCententP )
                                radius          :r
                                startAngle      :0
                                endAngle        :2 * M_PI
                                clockwise       :YES]];

        lastXPoint = xCententP;
        lastYPoint = yCententP;
        xPoint += 30;
        yPoint +=(70)*((i%2)?-1:1);
    }
    [shapeLayer setPath:bezierPath.CGPath];
}


- (void)tapClicked:(UITapGestureRecognizer *)tap{
    if ([self.delegate respondsToSelector:@selector(yMDrawView:image:)]) {
        [self.delegate yMDrawView:self image:[self interceptImage]];
    }
}

- (void)showInfo{
    [refractLineLayer removeFromSuperlayer];
    /**
     doSomething
     */
    [self showLayer];
}

#pragma mark --helper

/**数组转化*/



@end
