//
//  ViewController.m
//  IB_DESIGNABLE
//
//  Created by Tianjian on 16/5/17.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "ViewController.h"
#import "KeyBoard.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *evtxfName;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //UIView *keyBoardContent = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)];
    //keyBoardContent.backgroundColor = [UIColor darkGrayColor];
    //_evtxfName.inputView = keyBoardContent;
    
    //自定义键盘辅助视图    
    KeyBoard *keyBoard = [[[NSBundle mainBundle]loadNibNamed:@"KeyBoard" owner:nil options:nil]firstObject];
    
    _evtxfName.inputAccessoryView = keyBoard;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
@end
