//
//  ViewController.m
//  Cocoa_NSObject
//
//  Created by Tianjian on 16/3/25.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>

#import "NSObject+AddProperty.h"
#import "AddPropertyDTO.h"
#import "UIView+ProgressHUD.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self runtimeModifyNSObjectProperty];
    
    [self delogNSObjectPropertyNameAndType];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"xxxxx");
    [self.view showLoadingViewWithMessage:@"加载..."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view stopLoadingViewWithMessage:@"加载成功"];
    });
}

//使用runtime运行时修改对象的值，当NSString类型属性的值为nil,Null时
- (void)runtimeModifyNSObjectProperty{
    NSObject *object1 = [[NSObject alloc]init];
    object1.hotName = nil;
    NSLog(@"hotName属性值 ＝ %@\n",object1.hotName);
    
    NSObject *object2 = [[NSObject alloc]init];
    object2.hotName = @"属性已经赋值";
    NSLog(@"hotName属性值 ＝ %@\n",object2.hotName);
}

//打印NSObject对象的属性名和属性类型
- (void)delogNSObjectPropertyNameAndType{
    unsigned int count = 0 ;
    //获取到所有的成员变量列表
    Ivar *vars = class_copyIvarList([AddPropertyDTO class], &count);
    for (int i = 0; i < count; i++) {
        const char *propertyName = ivar_getName(vars[i]);        //获取变量名
        const char *propertyType = ivar_getTypeEncoding(vars[i]);//获取变量编码类型
        
        printf("propertyName:%s propertyType:%s\n",propertyName,propertyType);
    }
}

@end
