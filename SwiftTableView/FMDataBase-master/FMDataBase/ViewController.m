//
//  ViewController.m
//  FMDataBase
//
//  Created by 林梦夕 on 15/6/24.
//  Copyright (c) 2015年 林梦夕. All rights reserved.
//

#import "ViewController.h"
#import "FMDB.h"

@interface ViewController ()

@property (nonatomic,strong) FMDatabase *data;

@end

@implementation ViewController

/**
 *  数据库
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)sqlite:(UIButton *)sender {
//    1.创建数据库路径
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"FMDataBase.sqlite"];
//    2.创建数据库
    self.data = [FMDatabase databaseWithPath:path];
    
    if (![self.data open]) {
        NSLog(@"失败");
        return;
    }
    
//    3.创建表
    [self.data executeUpdate:@"CREATE TABLE Car(name text, year integer)"];
 
    
}

- (IBAction)insert:(UIButton *)sender {
    [self.data executeUpdate:@"INSERT INTO Car(name,year) VALUES(?,?)",@"保时捷",[NSNumber numberWithInt:12]];
    
//    NSString *sql = [NSString stringWithFormat:@"INSERT INTO Car(name ,year) VALUES(？,？)",@"保时捷",[NSNumber numberWithInt:12]];
//    [self.data executeUpdate:sql];
    
//    NSString *sql = @"INSERT INTO Car(name,year) VALUES(?,?)";
//    [self.data executeUpdate:sql,@"保时捷",[NSNumber numberWithInt:12]];
    

    
}

- (IBAction)delete:(UIButton *)sender {
    
    
   [self.data executeUpdate:@"DELETE FROM Car WHERE name = ?",@"宝马"];
    
}

- (IBAction)change:(UIButton *)sender {
    
    [self.data executeUpdate:@"UPDATE Car SET name = ? WHERE name = ?",@"宝马",@"保时捷"];
}

- (IBAction)querry:(UIButton *)sender {
    
//    NSString *querry = [self.data stringForQuery:@"SELECT year FROM Car WHERE name = ?",@"宝马"];
    
//    NSLog(@"querry=%@",querry);
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
