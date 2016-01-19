//
//  DemoVC1.m
//  TestUIViewAnimations
//
//  Created by Tianjian on 16/1/8.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "DemoVC1.h"

@interface DemoVC1 ()

@end

#define ScreenWidth  [UIScreen mainScreen].bounds.size.height
#define ScreenHeight [UIScreen mainScreen].bounds.size.width

@implementation DemoVC1{
    UIView *v;
    UIView *card;
}


#pragma mark -initMethod
- (void)initXibProperty{
    
    v = [UIView new];
    v.frame = CGRectMake(0, 0, 0, 0);
    
    v.backgroundColor = [UIColor redColor];
    [self.view addSubview:v];
    
    card = [UIView new];
    card.frame = CGRectMake(20,ScreenHeight/2.0-10 , 0, 30);
    card.backgroundColor = [UIColor greenColor];
    [self.view addSubview:card];
}
- (void)initBaseDataInfo{
}
#pragma mark -Life Cycle
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initXibProperty];
    [self initBaseDataInfo];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self startAnimation];
    [self startAnimationCard];
}
- (void)startAnimationCard{
    //1.
    [UIView beginAnimations:nil context:nil];
    //2.
    [UIView setAnimationDuration:3];
    //3.
    [UIView setAnimationDelegate:self];
    //4.
    [UIView setAnimationDidStopSelector:@selector(didStopAnimationCard)];
    //5.
    card.frame = CGRectMake(ScreenWidth- 20-40,ScreenHeight/2.0-10 , 100, 30);
    //6.
    [UIView commitAnimations];
}
- (void)startAnimation{
    //1.
    [UIView beginAnimations:nil context:nil];
    //2.
    [UIView setAnimationDuration:1];
    //3.
    [UIView setAnimationDelegate:self];
    //4.
    [UIView setAnimationDidStopSelector:@selector(didStopAnimation)];
    //5.
    v.frame  = CGRectMake(0, 0, 200, 200);
    v.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2.0, [UIScreen mainScreen].bounds.size.height/2.0);
    //6.
    [UIView commitAnimations];
}
- (void)didStopAnimation{
    v.frame = CGRectMake(0, 0, 0, 0);
    NSLog(@"结束动画");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startAnimation];
    });
}
- (void)didStopAnimationCard{
    card.frame = CGRectMake(20,ScreenHeight/2.0-10 , 0, 30);
    NSLog(@"结束动画");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startAnimationCard];
    });
}

@end
