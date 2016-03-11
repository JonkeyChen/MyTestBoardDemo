//
//  UIView+CGSize.m
//  RunTime_TagName
//
//  Created by Tianjian on 16/3/7.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "UIView+CGSize.h"

@implementation UIView (CGSize)

- (void)setSize:(CGSize)size{
    CGRect newBounds = self.bounds;
    newBounds.size = size;
    self.frame = newBounds;
}

@end
