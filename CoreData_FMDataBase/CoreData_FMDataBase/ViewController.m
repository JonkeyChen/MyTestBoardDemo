//
//  ViewController.m
//  CoreData_FMDataBase
//
//  Created by Tianjian on 16/3/8.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "ViewController.h"

/**数据库名称*/
static NSString *const dataName = @"student.sqlite";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initFMData];
}

//1.创建数据库
- (void)initFMData{
    //1.创建数据库文件路径
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES)lastObject];
    //2.拼接数据库名称
    NSString *fileName = [document stringByAppendingPathComponent:@"Company.sqlite"];
    //3.获取数据库
    FMDatabase *db = [FMDatabase databaseWithPath:fileName];
    
    if ([db open]) {
        NSLog(@"数据库打开");
        //4.创表
        //BOOL result = [db executeUpdate:@“CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREM ENT, name text NOT NULL, age integer NOT NULL);”];
        BOOL result = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREM ENT, name text NOT NULL, age integer NOT NULL);"];
        if (result) {
            NSLog(@"简表成功");
        }
    } else {
        NSLog(@"数据库打开失败");
    }
}

@end
