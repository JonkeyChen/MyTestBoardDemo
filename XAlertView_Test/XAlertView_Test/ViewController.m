//
//  ViewController.m
//  XAlertView_Test
//
//  Created by Tianjian on 16/3/11.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "ViewController.h"

#import "XActionSheet.h"
#import "XAlertView.h"

@interface ViewController ()<XAlertDelegate,XActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UIButton *evbtn1;
@property (weak, nonatomic) IBOutlet UIButton *evbtn2;
@property (weak, nonatomic) IBOutlet UIButton *evbtn3;
@property (weak, nonatomic) IBOutlet UIButton *evbtn4;
@property (weak, nonatomic) IBOutlet UIButton *evbtn5;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_evbtn1 addTarget:self action:@selector(actionsheet1) forControlEvents:UIControlEventTouchUpInside];
    [_evbtn2 addTarget:self action:@selector(actionsheet2) forControlEvents:UIControlEventTouchUpInside];
    [_evbtn3 addTarget:self action:@selector(AlertView1) forControlEvents:UIControlEventTouchUpInside];
    [_evbtn4 addTarget:self action:@selector(AlertView2) forControlEvents:UIControlEventTouchUpInside];
    [_evbtn5 addTarget:self action:@selector(AlertView3) forControlEvents:UIControlEventTouchUpInside];
}
/********************XActionSheet**********************/
- (void)actionsheet1{
    XActionSheet *sheet = [[XActionSheet alloc]initWithTitleAndDesc:@"这是一个上啦菜单" Desc:@"你可以在这里填写一些详细内容"];
    [sheet addCancelButtonWithTitle:@"取消"];
    [sheet addButtonwithTitle:@"按钮一"];
    [sheet addButtonwithTitle:@"按钮二"];
    [sheet addButtonwithTitle:@"按钮三"];
    sheet.delegate = self;
    [sheet show];
}
- (void)actionsheet2{
    XActionSheet *sheet = [[XActionSheet alloc]initWithTitleAndDesc:@"这是一个上啦菜单" Desc:@"你可以在这里填写一些详细内容"];
    [sheet addCancelButtonWithTitle:@"取消"];
    [sheet addButtonwithTitle:@"按钮一"];
    [sheet addButtonwithTitle:@"按钮二"];
    [sheet addButtonwithTitle:@"按钮三"];
    sheet.delegate = self;
    [sheet showInAnimate];
}
#pragma mark XActionSheetDelegate
-(void)buttonClick:(NSInteger)index{
}
/********************XAlertView**********************/
- (void)AlertView1{
    XAlertView *alert = [[XAlertView alloc]initWithTitleAndDesc:@"这是一个警告框" Desc:@"这里可以填一些详细内容"];
    alert.btnTitleArray = @[@"按钮一",@"按钮二",@"按钮三"];
    [alert showAnimation1];
    alert.delegate = self;
    [alert showAnimation1];

}
- (void)AlertView2{
    XAlertView *alert = [[XAlertView alloc]init];
    alert.containViewHeight = 100;
    CGFloat width = alert.containView.frame.size.width;
    UIImageView *avatar = [[UIImageView alloc]initWithFrame:CGRectMake((width - 60)/2, 10, 60, 60)];
    avatar.layer.cornerRadius = 30;
    avatar.layer.masksToBounds = true;
    avatar.image = [UIImage imageNamed:@"cute_girl"];
    [alert.containView addSubview:avatar];
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(0, 10 + 60 + 10,width, 20)];
    name.text = @"StrongX";
    name.textColor = [UIColor darkGrayColor];
    name.textAlignment = NSTextAlignmentCenter;
    [alert.containView addSubview:name];
    
    alert.btnTitleArray = @[@"确定",@"关闭"];
    alert.delegate = self;
    [alert showAnimation2];
}
- (void)AlertView3{
    XAlertView *alert = [[XAlertView alloc]init];
    alert.containViewHeight = 65;
    CGFloat width = alert.containView.frame.size.width;
    
    UITextField *ettxfUserName = [[UITextField alloc]init];
    ettxfUserName.placeholder  = @"修改用户名";
    ettxfUserName.borderStyle  = UITextBorderStyleRoundedRect;
    ettxfUserName.frame = CGRectMake(5,30,width - 10, 30);
    [alert.containView addSubview:ettxfUserName];
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(0, 5,width, 20)];
    name.text = @"StrongX";
    name.textColor = [UIColor darkGrayColor];
    name.textAlignment = NSTextAlignmentCenter;
    [alert.containView addSubview:name];

    
    alert.btnTitleArray = @[@"确定",@"关闭"];
    alert.delegate = self;
    [alert showAnimation2];
    
}

#pragma mark XAlertDelegate
-(void)btnClicked:(NSInteger)index{

}

@end
