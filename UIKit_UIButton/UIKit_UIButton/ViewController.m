//
//  ViewController.m
//  UIKit_UIButton
//
//  Created by Tianjian on 16/2/25.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(50, 200, 200, 50);
    button.layer.masksToBounds = YES;
    button.layer.borderColor   = [UIColor redColor].CGColor;
    button.layer.borderWidth   = 1;
    
    [button setTitle:@"我是UIButton" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor orangeColor]];
    button.titleLabel.textAlignment = NSTextAlignmentLeft;
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.view addSubview:button];
    
    //UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)
    //button.contentEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    button.titleEdgeInsets   = UIEdgeInsetsMake(0, 20, 0, 0);
    
    UIButton *button1 = [[UIButton alloc] init];
    button1.frame = CGRectMake(50, 300, 200, 200);
    [button1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor orangeColor]];
    [button1 setImage:[UIImage imageNamed:@"btn_nomarl_Background"] forState:UIControlStateNormal];
    [button1 setTitle:@"按钮" forState:UIControlStateNormal];
    [self.view addSubview:button1];
    
    button1.imageEdgeInsets = UIEdgeInsetsMake(-100, 0, 0, 0);
    button1.titleEdgeInsets = UIEdgeInsetsMake(100, 0, 0, 0);
    
    return;
    //1.
    UIButton *etbtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    etbtn1.backgroundColor = [UIColor greenColor];
    etbtn1.frame = CGRectMake(20, 40, 200, 30);
    etbtn1.tag = 100;
    [etbtn1 setTitle:@"点击状态文字" forState:UIControlStateHighlighted];
    [etbtn1 setTitle:@"正常状态文字" forState:UIControlStateNormal];
    [etbtn1 setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [etbtn1 setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    [etbtn1 setImage:[UIImage imageNamed:@"btn_normal.png"] forState:UIControlStateNormal];
    [etbtn1 setImage:[UIImage imageNamed:@"btn_selected.png"] forState:UIControlStateHighlighted];
    //[etbtn1 setBackgroundImage:[UIImage imageNamed:@"btn_nomarl_Background"] forState:UIControlStateNormal];
    //[etbtn1 setBackgroundImage:[UIImage imageNamed:@"btn_selected_Background"] forState:UIControlStateHighlighted];
    
    etbtn1.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 100);
    etbtn1.imageEdgeInsets   = UIEdgeInsetsMake(0, 100, 0, 0);
    
    [etbtn1 addTarget:self
               action:@selector(_efOnClick:withEvent:)       //触发的函数
     forControlEvents:UIControlEventTouchUpInside];//设置出发触发状态
    [self.view addSubview:etbtn1];
    
/**************************************UIButton当前状态下的各种属性（对象）*****************************************************************/
//    currentTitle;             //当前状态下标题     normal/highlighted/selected/disabled. can return nil                                 /
//    currentTitleColor;         //当前状态下标题颜色  normal/highlighted/selected/disabled. always returns non-nil. default is white(1,1)  /
//    currentImage;             //当前状态下图片     normal/highlighted/selected/disabled. can return nil                                 /
//    currentBackgroundImage;   //当前状态下背景图片  normal/highlighted/selected/disabled. can return nil                                 /
/***************************************************************************************************************************************/

/********************************UIControlEvent状态列表*************************************/
    UIControlEventTouchDown           ;      // 用户按下时触发
    UIControlEventTouchDownRepeat     ;      // 点击次数大于1时触发
    UIControlEventTouchDragInside     ;      // 当触摸在控件内拖动时触发
    UIControlEventTouchDragOutside    ;      // 当触摸在控件之外拖动时触发
    UIControlEventTouchDragEnter      ;      // 当触摸从控件外拖动到内部时
    UIControlEventTouchDragExit       ;      // 当触摸从控件内拖动到外部时
    UIControlEventTouchUpInside       ;      // 在控件内触摸抬起时
    UIControlEventTouchUpOutside      ;      // 在控件外触摸抬起时
    UIControlEventTouchCancel         ;      // 触摸取消事件，设备被锁上或者电话呼叫打断
    UIControlEventValueChanged        ;      // 当控件的值发生改变时
    UIControlEventEditingDidBegin     ;      // 文本控件开始编辑时
    UIControlEventEditingChanged      ;      // 文本控件的文本改变
    UIControlEventEditingDidEnd       ;      // 文本控件结束编辑时
    UIControlEventEditingDidEndOnExit ;      // 文本控件内通过按下回车键结束编辑时
    UIControlEventAllTouchEvents      ;      // 所有触摸事件
    UIControlEventAllEditingEvents    ;      // 文本编辑的所有事件，for UITextField
    UIControlEventAllEvents           ;      // 所有事件
/****************************************************************************************/
    
/***************UIButton点击状态****************/
    UIControlStateApplication;
    UIControlStateDisabled;
    UIControlStateFocused;
    UIControlStateReserved;
    UIControlStateHighlighted;
    UIControlStateSelected;     //选择中状态
    UIControlStateNormal;       //正常显示状态
/*********************************************/
    
/*****************************UIButtonTye(按钮风格)****************************************/
    UIButtonTypeCustom ;           //自定义，无风格
    UIButtonTypeRoundedRect;       //白色圆角矩形，类似偏好设置表格单元或者地址簿卡片
    UIButtonTypeDetailDisclosure ; //蓝色的披露按钮，可放在任何文字旁
    UIButtonTypeInfoLight;         //微件(widget)使用的小圆圈信息按钮
    UIButtonTypeInfoDark    ;      //白色背景下使用的深色圆圈信息按钮
    UIButtonTypeContactAdd;        //蓝色加号(+)按钮，可以放在任何文字旁
/****************************************************************************************/
}
//
- (void)_efOnClick:(UIButton*)btn withEvent:(UIEvent*)event{
    //触发函数，在里面进行其它操作
    
    //注意了!!!!!!!!!
    //说名：防止用户恶意暴力点击按钮
    UITouch *touch = [[event allTouches] anyObject];
    if (touch.tapCount == 1) {//当用户瞬间点击次数为1的时候触发
        
    }
}

@end
