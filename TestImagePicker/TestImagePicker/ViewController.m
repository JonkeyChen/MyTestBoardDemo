//
//  ViewController.m
//  TestImagePicker
//
//  Created by Tianjian on 15/12/15.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "ViewController.h"

#define defaultNumberLine 3 //每行图片个数
#define defaultMaxImages  4 //可选图片张数

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *evbtnShow;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.evbtnShow addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
}
- (void)show{
}

@end
