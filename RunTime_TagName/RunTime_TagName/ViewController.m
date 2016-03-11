//
//  ViewController.m
//  RunTime_TagName
//
//  Created by Tianjian on 16/3/7.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "ViewController.h"
#import "UIView+CGPoint.h"
#import "UIView+CGSize.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *evContent;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[touches allObjects]lastObject];
    CGPoint point  = [touch locationInView:self.view];
    
    [_evContent setSize:CGSizeMake(300, 20)];
    [_evContent setOrigin:point];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
