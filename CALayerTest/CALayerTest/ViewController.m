//
//  ViewController.m
//  CALayerTest
//
//  Created by Tianjian on 15/11/24.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "ViewController.h"
#import "YYView.h"

@interface ViewController ()

@property (nonatomic,strong) CALayer *myLayer;

@property (nonatomic,strong) CALayer *myLayerMove;

@end

@implementation ViewController
- (IBAction)ddd:(id)sender forEvent:(UIEvent *)event {
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //[self _efDraw];
    [self _efShowMoveLayer];
}

- (void)_efShowMoveLayer{
    self.myLayerMove = [[CALayer alloc]init];
    self.myLayerMove.bounds = CGRectMake(0, 0, 50, 80);
    self.myLayerMove.backgroundColor = [UIColor yellowColor].CGColor;
    self.myLayerMove.position = CGPointMake(50, 50);
    self.myLayerMove.anchorPoint = CGPointZero;
    self.myLayerMove.cornerRadius = 20;
    [self.view.layer addSublayer:self.myLayerMove];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CABasicAnimation *anmation = [CABasicAnimation animation];
    
    anmation.keyPath = @"position";
    
    anmation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    anmation.toValue   = [NSValue valueWithCGPoint:CGPointMake(200, 300)];
    
    anmation.removedOnCompletion = NO;
    anmation.fillMode = kCAFillModeForwards;
    
    [self.myLayerMove addAnimation:anmation forKey:nil];
    
    return;
    static BOOL is = NO;
    [CATransaction begin];
    [CATransaction setDisableActions:NO];
    if (is) {
        self.myLayer.bounds = CGRectMake(0, 0, 200, 50);
        self.myLayer.backgroundColor = [UIColor yellowColor].CGColor;
    } else {
        self.myLayer.bounds = CGRectMake(0, 0, 100, 100);
        self.myLayer.backgroundColor = [UIColor redColor].CGColor;
    }
    [CATransaction commit];
    is = !is;
}

- (void)_efDraw{
    CALayer *layer = [[CALayer alloc]init];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.anchorPoint = CGPointMake(0, 0);//CGPointZero;
    layer.position = CGPointMake(100, 200);
    layer.cornerRadius = 10;
    
    layer.delegate = self;
    [layer setNeedsDisplay];
    
    [self.view.layer addSublayer:layer];
    
    self.myLayer = layer;
}
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    CGContextAddEllipseInRect(ctx, CGRectMake(25, 25, 50, 50));
    CGContextSetRGBFillColor(ctx, 0.6, 0.7, 1, 1);
    CGContextFillPath(ctx);
}

@end
