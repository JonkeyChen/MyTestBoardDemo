//
//  UIView+CornerRadius.m
//  IB_DESIGNABLE
//
//  Created by Tianjian on 16/5/17.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "UIView+CornerRadius.h"
#import <objc/runtime.h>

@implementation MGOTextField
@end

@implementation MGOLabel
@end

@implementation MGOImageView
@end

@implementation MGOButton
@end

@implementation MGOView
@end

@implementation UIView (CornerRadius)

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius  = cornerRadius;
}

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (void)setDefineValue:(CGFloat)defineValue {
    objc_setAssociatedObject(self, @selector(defineValue), @(defineValue),OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}

- (UIColor*)borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (CGFloat)defineValue {
    return [objc_getAssociatedObject(self, @selector(defineValue)) floatValue];
}

@end
