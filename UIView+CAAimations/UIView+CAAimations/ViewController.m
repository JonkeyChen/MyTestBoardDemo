//
//  ViewController.m
//  UIView+CAAimations
//
//  Created by Tianjian on 16/3/23.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong,nonatomic) UIView *antimations;

@property (strong,nonatomic) UILabel *evlblContent;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _antimations = ({
        UIView *v = [[UIView alloc]init];
        v.frame = CGRectMake(160, 160, 15, 15);
        v.backgroundColor = [UIColor greenColor];
        [self.view addSubview:v];
        v;
    });
    
    _evlblContent = ({
        UILabel *etlbl = [[UILabel alloc]init];
        etlbl.frame = CGRectMake(10, 190, 200, 20);
        etlbl.text  = @"express调试";
        [self.view addSubview:etlbl];
        etlbl;
    });
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //[self addAntimation:_antimations];
    //[self addAntimation:_antimations];
    //[self addCAKeyPathAnimation:_antimations];
    //[self addCAKeyMediaTimingFunction:_antimations];
    //[self addCAKeyFunctionWithControlPoints:_antimations];
    //[self addCAKeyCAAnimationGroup:_antimations];

    int count = 5;
    
    for (int i = 0; i<count; i++) {
        NSLog(@"第%d",i);
    }
}

//基本动画
- (void)addAntimation:(UIView*)v{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @77;
    animation.toValue = @455;
    animation.duration = 1;
    
    //使rocket留在最终状态，设置removedOnCompletion为No以防止它被自动移除
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    [v.layer addAnimation:animation forKey:@"basic"];
}

//多步动画
- (void)addCAKeyframeAnimation:(UIView*)formView{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[ @0, @10, @-10, @10, @0 ];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.4;
    
    animation.additive = YES;
    
    [formView.layer addAnimation:animation forKey:@"shake"];
}
//沿路径的动画
- (void)addCAKeyPathAnimation:(UIView*)formView{
    CGRect boundingRect = CGRectMake(20, 20, 100, 100);
    CAKeyframeAnimation *orbit = [CAKeyframeAnimation animation];
    orbit.keyPath = @"position";
    orbit.path = CFAutorelease(CGPathCreateWithEllipseInRect(boundingRect, NULL));
    orbit.duration = 4;
    orbit.additive = YES;
    orbit.repeatCount = HUGE_VALF;
    orbit.calculationMode = kCAAnimationPaced;
    orbit.rotationMode = kCAAnimationRotateAuto;
    
    [formView.layer addAnimation:orbit forKey:@"orbit"];
}
//时间函数 CAMediaTimingFunction
- (void)addCAKeyMediaTimingFunction:(UIView*)rectangle{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @50;
    animation.toValue = @300;
    animation.duration = 1;
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [rectangle.layer addAnimation:animation forKey:@"basic"];
    
    rectangle.layer.position = CGPointMake(155, 155);
}

//Core Animation附带了一些linear之外的内置easing函数 + functionWithControlPoints:::: 创建自己的 easing 函数
- (void)addCAKeyFunctionWithControlPoints:(UIView*)rocket{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.y";
    animation.fromValue = @10;
    animation.toValue = @300;
    animation.duration = 1;
    
    animation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.2:0.1:0.9:0.2];
    
    [rocket.layer addAnimation:animation forKey:@"basic"];
    
    rocket.layer.position = CGPointMake(155, 155);
}

//动画组
//复杂动画，同时为多个属性进行动画。同时对position,rotation和z-position进行动画。使用CAAnimationGroup
- (void)addCAKeyCAAnimationGroup:(UIView*)card{
    CABasicAnimation *zPosition = [CABasicAnimation animation];
    zPosition.keyPath = @"zPosition";
    zPosition.fromValue = @-1;
    zPosition.toValue = @1;
    zPosition.duration = 1.2;
    
    CAKeyframeAnimation *rotation = [CAKeyframeAnimation animation];
    rotation.keyPath = @"transform.rotation";
    rotation.values = @[ @0, @0.14, @0 ];
    rotation.duration = 1.2;
    rotation.timingFunctions = @[
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                 ];
    
    CAKeyframeAnimation *position = [CAKeyframeAnimation animation];
    position.keyPath = @"position";
    position.values = @[
                        [NSValue valueWithCGPoint:CGPointZero],
                        [NSValue valueWithCGPoint:CGPointMake(110, -20)],
                        [NSValue valueWithCGPoint:CGPointZero]
                        ];
    position.timingFunctions = @[
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                 ];
    position.additive = YES;
    position.duration = 1.2;
    
    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    group.animations = @[ zPosition, rotation, position ];
    group.duration = 1.2;
    group.beginTime = 0.5;
    
    [card.layer addAnimation:group forKey:@"shuffle"];
    
    card.layer.zPosition = 1;
}

@end
