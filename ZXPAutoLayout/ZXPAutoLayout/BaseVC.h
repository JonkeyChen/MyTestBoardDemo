//
//  BaseVC.h
//  Test
//
//  Created by Tianjian on 15/12/25.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+SDAutoLayout.h"

@interface BaseVC : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) UITableView *evtblList;

@property (strong,nonatomic) NSMutableArray *arrList;

@property (nonatomic, weak) UIView *view0;
@property (nonatomic, weak) UIView *view1;
@property (nonatomic, weak) UIView *view2;
@property (nonatomic, weak) UIView *view3;
@property (nonatomic, weak) UIView *view4;
@property (nonatomic, weak) UIView *view5;
@property (nonatomic, weak) UIView *view6;
@property (nonatomic, weak) UIView *view7;
@property (nonatomic, weak) UIView *view8;

@end
