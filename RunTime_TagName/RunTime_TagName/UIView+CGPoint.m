//
//  UIView+CGPoint.m
//  RunTime_TagName
//
//  Created by Tianjian on 16/3/7.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "UIView+CGPoint.h"

@implementation UIView (CGPoint)

- (void)setOrigin:(CGPoint)aPoint{
    CGRect newFrame = self.frame;
    
    newFrame.origin = aPoint;
    
    self.frame = newFrame;
}

@end
