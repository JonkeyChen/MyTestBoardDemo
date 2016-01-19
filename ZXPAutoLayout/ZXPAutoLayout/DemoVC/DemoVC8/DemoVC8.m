//
//  DemoVC8.m
//  Test
//
//  Created by Tianjian on 15/12/28.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "DemoVC8.h"
#import "DemoVC8DTO.h"
#import "DemoVC8Cell1.h"
#import "UITableView+SDAutoTableViewCellHeight.h"

@interface DemoVC8 ()

@end

@implementation DemoVC8


#pragma mark -initMethod
- (void)initXibProperty{
    [self evtblList].sd_layout.spaceToSuperView(UIEdgeInsetsZero);
    [[self evtblList]registerClass:[DemoVC8Cell1 class] forCellReuseIdentifier:NSStringFromClass([DemoVC8Cell1 class])];
}
- (void)initBaseDataInfo{
    NSArray *iconImageNamesArray = @[@"icon0.jpg",
                                     @"icon1.jpg",
                                     @"icon2.jpg",
                                     @"icon3.jpg",
                                     @"icon4.jpg",
                                     ];
    
    NSArray *namesArray = @[@"GSD_iOS",
                            @"风口上的猪",
                            @"当今世界网名都不好起了",
                            @"我叫郭德纲",
                            @"Hello Kitty"];
    
    NSArray *textArray = @[@"当你的 app 没有提供 3x 的 LaunchImage 时，系统默认进入兼容模式，大屏幕一切按照 320 宽度渲染，屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                           @"然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                           @"当你的 app 没有提供 3x 的 LaunchImage 时",
                           @"但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                           @"屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。但是建议不要长期处于这种模式下。"
                           ];
    
    NSArray *picImageNamesArray = @[ @"pic0.jpg",
                                     @"pic1.jpg",
                                     @"pic2.jpg",
                                     @"pic3.jpg",
                                     @"pic4.jpg",
                                     @"pic5.jpg",
                                     @"pic6.jpg",
                                     @"pic7.jpg",
                                     @"pic8.jpg"
                                     ];
    
    for (int i = 0; i < 10; i++) {
        int iconRandomIndex = arc4random_uniform(5);
        int nameRandomIndex = arc4random_uniform(5);
        int contentRandomIndex = arc4random_uniform(5);
        
        DemoVC8DTO *model = [DemoVC8DTO new];
        model.iconName = iconImageNamesArray[iconRandomIndex];
        model.name = namesArray[nameRandomIndex];
        model.content = textArray[contentRandomIndex];
        
        int random = arc4random_uniform(10);
        NSMutableArray *temp = [NSMutableArray new];
        for (int i = 0; i < random; i++) {
            int randomIndex = arc4random_uniform(9);
            [temp addObject:picImageNamesArray[randomIndex]];
        }
        if (temp.count) {
            model.picNamesArray = [temp copy];
        }
        
        [[self arrList] addObject:model];
    }
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
    
    [self initBaseDataInfo];
    [self initXibProperty];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark -Delegate 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    [tableView startAutoCellHeightWithCellClass:[DemoVC8Cell1 class] contentViewWidth:[UIScreen mainScreen].bounds.size.width];
    return self.arrList.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DemoVC8Cell1 *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DemoVC8Cell1 class])];
    [cell setModel:self.arrList[indexPath.row]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView cellHeightForIndexPath:indexPath model:[self arrList][indexPath.row] keyPath:@"model"];
}

#pragma mark -Action Respone

#pragma mark -OtherMethod

#pragma mark -Getters and Setters

#pragma mark -Request

@end
