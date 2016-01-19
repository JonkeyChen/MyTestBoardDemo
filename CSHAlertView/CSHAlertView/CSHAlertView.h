//
//  CSHAlertView.h
//  CSHAlertView
//
//  Created by 陈胜华 on 15/11/24.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^efOnClickLeft)();
typedef void(^efOnClickRight)();

@interface CSHAlertView : UIView

- (id)initTitle:(NSString*)title content:(NSString*)content leftAction:(efOnClickLeft)left rightAction:(efOnClickRight)right;

- (void)show;

@end
