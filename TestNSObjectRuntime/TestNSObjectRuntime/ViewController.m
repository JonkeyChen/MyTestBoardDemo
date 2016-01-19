//
//  ViewController.m
//  TestNSObjectRuntime
//
//  Created by Tianjian on 15/11/19.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "ViewController.h"
#import "BaseObjcet.h"
#import "NSObject+CheckEntity.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    BaseObjcet *objc = [BaseObjcet new];

//    checkEntity(objc);
    NSLog(@"第一种情况（什么都没有）");
    NSLog(@"name: %@", objc.name);
    NSLog(@"number: %@", objc.number);
    NSLog(@"array: %@", objc.arrary);
    
    BaseObjcet *objc1 = [BaseObjcet new];
    checkEntity(objc1);
    NSLog(@"第二种情况（处理了）");
    NSLog(@"name: %@", objc1.name);
    NSLog(@"number: %@", objc1.number);
    NSLog(@"array: %@", objc1.arrary);
}
- (IBAction)ShowImagePicker:(id)sender {
}
- (IBAction)_show:(id)sender {
}
- (IBAction)yyy:(id)sender {
}
- (IBAction)uyyyy:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
