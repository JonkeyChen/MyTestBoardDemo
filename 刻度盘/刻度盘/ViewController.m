//
//  ViewController.m
//  刻度盘
//
//  Created by Tianjian on 16/3/14.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "ViewController.h"
#import "CircleChartView.h"
#import "CircleView.h"

@interface ViewController ()

@property (strong,nonatomic) CircleChartView *v ;

@property (strong,nonatomic) CircleView *circleView;
@property (weak, nonatomic) IBOutlet UILabel *evlblValue;
@property (weak, nonatomic) IBOutlet UITextField *evtxfNumber;


@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{


}
- (void)viewDidAppear:(BOOL)animated{
    self.circleView.percentPI = 120;
}

- (IBAction)_efOnClickSearch:(id)sender {
    self.evlblValue.text = [NSString stringWithFormat:@"(角度值： %@ ＋ 计算值：%@)",@([self.evtxfNumber.text doubleValue]*180),self.evtxfNumber.text];
    self.circleView.percentPI = [self.evtxfNumber.text doubleValue]*180;
    [self.view endEditing:YES];
}

#pragma mark -initMethod
- (void)initXibProperty{
    self.circleView = [[CircleView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)*0.5, 130, 200, 100)];
    [self.view addSubview:self.circleView];
    self.evlblValue.text = [NSString stringWithFormat:@"(角度值： %@ ＋ 计算值：%@ )",@([self.evtxfNumber.text intValue]*180),@([self.evtxfNumber.text intValue])];
    
    //_v = [[CircleChartView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)*0.5, 250, 200, 200)];
    //[self.view addSubview:_v];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initXibProperty];
}

@end
