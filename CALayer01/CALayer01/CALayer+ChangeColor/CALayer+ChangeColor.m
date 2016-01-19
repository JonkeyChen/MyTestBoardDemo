
//
//  CALayer+ChangeColor.m
//  CALayer01
//
//  Created by Tianjian on 15/11/26.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "CALayer+ChangeColor.h"
#import <UIKit/UIKit.h>

@implementation CALayer (ChangeColor)

- (void)addChangeColors:(NSArray*)colors{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    gradient.colors = colors;
    [self insertSublayer:gradient atIndex:0];
}

@end
