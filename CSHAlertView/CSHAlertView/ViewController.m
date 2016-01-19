//
//  ViewController.m
//  CSHAlertView
//
//  Created by Tianjian on 15/11/24.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

#define WIDTH 50
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1
    self.view.layer.backgroundColor = [UIColor orangeColor].CGColor;
    self.view.layer.cornerRadius = 20;
    self.view.layer.frame = CGRectInset(self.view.layer.frame, 20, 20);
    //2.
    CALayer *subLayer = [CALayer layer];
    subLayer.backgroundColor = [UIColor blueColor].CGColor;
    subLayer.shadowOffset = CGSizeMake(0, 3);
    subLayer.shadowColor = [UIColor blackColor].CGColor;
    subLayer.shadowOpacity = 0.8;
    subLayer.frame = CGRectMake(30, 30, 128, 192);
    [self.view.layer addSublayer:subLayer];
    //3.
    //subLayer.contents = (id)[UIImage imageNamed:@"2.png"].CGImage;
    //subLayer.borderColor = [UIColor blackColor].CGColor;
    //subLayer.borderWidth = 2;
    //4.
    CALayer *imageLayer = [CALayer layer];
    imageLayer.frame = subLayer.bounds;
    imageLayer.cornerRadius = 10.0;
    imageLayer.contents = (id)[UIImage imageNamed:@"2.png"].CGImage;
    imageLayer.masksToBounds = YES;
    [subLayer addSublayer:imageLayer];
    
    [self.view.layer setNeedsDisplay];
    return;
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor blueColor].CGColor;
    layer.position = CGPointMake(size.width/2.0, size.height/2.0);
    layer.bounds = CGRectMake(0, 0, WIDTH, WIDTH);
    layer.cornerRadius = WIDTH/2.0;
    layer.shadowColor = [UIColor yellowColor].CGColor;
    layer.shadowOffset = CGSizeMake(2, 2);
    [self.view.layer addSublayer:layer];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CALayer *layer = self.view.layer.sublayers[0];
    CGFloat width_ = layer.bounds.size.width;
    if (width_ == WIDTH) {
        width_ = WIDTH*4;
    } else {
        width_ = WIDTH;
    }
    
    layer.bounds = CGRectMake(0, 0, width_, width_);
    layer.position = [touch locationInView:self.view];
    layer.cornerRadius = width_/2.0;
}

static inline double radians (double degrees) { return degrees * M_PI/180; }

void MyDrawColoredPattern (void*info, CGContextRef context){
    
    CGColorRef dotColor =[UIColor colorWithHue:0 saturation:0 brightness:0.07 alpha:1.0].CGColor;
    CGColorRef shadowColor =[UIColor colorWithRed:1 green:1 blue:1 alpha:0.1].CGColor;
    
    CGContextSetFillColorWithColor(context, dotColor);
    CGContextSetShadowWithColor(context, CGSizeMake(0, 1), 1, shadowColor);
    
    CGContextAddArc(context, 3, 3, 4, 0, radians(360), 0);
    CGContextFillPath(context);
    
    CGContextAddArc(context, 16, 16, 4, 0, radians(360), 0);
    CGContextFillPath(context);
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    
    CGColorRef bgColor =[UIColor colorWithHue:0.6 saturation:1.0 brightness:1.0 alpha:1.0].CGColor;
    CGContextSetFillColorWithColor(ctx, bgColor);
    CGContextFillRect(ctx, layer.bounds);
    
    static const CGPatternCallbacks callbacks ={0, &MyDrawColoredPattern, NULL};
    
    CGContextSaveGState(ctx);
    CGColorSpaceRef patternSpace = CGColorSpaceCreatePattern(NULL);
    CGContextSetFillColorSpace(ctx, patternSpace);
    CGColorSpaceRelease(patternSpace);
    
    CGPatternRef pattern = CGPatternCreate(NULL,
                                           layer.bounds,
                                           CGAffineTransformIdentity,
                                           24,
                                           24,
                                           kCGPatternTilingConstantSpacing,
                                           true,
                                           &callbacks);
    CGFloat alpha =1.0;
    CGContextSetFillPattern(ctx, pattern, &alpha);
    CGPatternRelease(pattern);
    CGContextFillRect(ctx, layer.bounds);
    CGContextRestoreGState(ctx);
}

@end
