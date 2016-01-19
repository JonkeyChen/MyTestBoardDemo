//
//  DemoVC4.m
//  Test
//
//  Created by Tianjian on 15/12/27.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "DemoVC4.h"
#import "SDRefresh.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "DemoVC4Cell.h"

@interface DemoVC4 ()<UITableViewDataSource,UITableViewDelegate>

@end

static NSString *const cellIndentifier = @"DemoVC4Indentifier";

@implementation DemoVC4{
    NSArray *arr_List;
    UITableView *evtblList;
}


#pragma mark -initMethod
- (void)initXibProperty{
    arr_List = @[@"当你的 app 没有提供 3x 的 LaunchImage 时，系统默认进入兼容模式，大屏幕一切按照 320 宽度渲染，屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                 @"然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                 @"当你的 app 没有提供 3x 的 LaunchImage 时",
                 @"但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                 @"屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。但是建议不要长期处于这种模式下，"
                 ];
    
    evtblList = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    evtblList.delegate = self;
    evtblList.dataSource = self;
//    [evtblList registerClass:[DemoVC4Cell class] forCellReuseIdentifier:cellIndentifier];
    [self.view addSubview:evtblList];
    evtblList.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
}
- (void)initBaseDataInfo{
    
}
#pragma mark -Life Cycle
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initXibProperty];
    [self initBaseDataInfo];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark -Delegate 代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    /****************************cell自适应步骤1*****************************/
    [tableView startAutoCellHeightWithCellClass:[DemoVC4Cell class]
                               contentViewWidth:[UIScreen mainScreen].bounds.size.width];
    return arr_List.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DemoVC4Cell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        cell = [[DemoVC4Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    /*****************************cell自适应步骤3******************************/
    [cell setText:arr_List[indexPath.row]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str = arr_List[indexPath.row];
    /******************************cell自适应步骤3*****************************/
    /***** model 为模型实例， keyPath 为 model 的属性名，通过 kvc 统一赋值接口 *****/
    return [tableView cellHeightForIndexPath:indexPath model:str keyPath:@"text"];
}

#pragma mark -Action Respone

#pragma mark -OtherMethod

#pragma mark -Getters and Setters

#pragma mark -Request

@end
