//
//  CircleChartView.h
//  刻度盘_Test
//
//  Created by Tianjian on 16/3/14.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import <UIKit/UIKit.h>

//gradientLayer + laye + strokeEnd
@interface CircleChartView : UIView

@property (nonatomic,assign) CGFloat startAngle;
@property (nonatomic,assign) CGFloat endAngle;
@property (nonatomic,assign) CGFloat pathWidth;


@property (assign,nonatomic) CGFloat percent;

@end
