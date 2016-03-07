//
//  ViewController.m
//  NSObject_KeyedArchiver
//
//  Created by Tianjian on 16/2/26.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    NSArray *array = [NSArray arrayWithObjects:@1,@2,@3, nil];
    
    NSString *filePath = [NSHomeDirectory() stringByAppendingString:@"testFile.plist"];
    
    BOOL success = [NSKeyedArchiver archiveRootObject:array toFile:filePath];
    
    NSLog(@"%d",success);
    NSLog(@"%@",filePath);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
