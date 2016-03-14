//
//  ViewController.m
//  DBSelectedViewTest
//
//  Created by Tianjian on 16/3/14.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "ViewController.h"
#import "DBSelectView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    DBSelectView *dbSelectetView = [DBSelectView selectView];
    
    dbSelectetView.frame = CGRectMake(10, 10, 100, 100);
    dbSelectetView.title_one = @"xxxx";
    dbSelectetView.title_two = @"uuuu";
    [self.view addSubview:dbSelectetView];
}


@end
