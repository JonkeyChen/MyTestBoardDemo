//
//  MyTextField.m
//  UIKit_UITextField
//
//  Created by Tianjian on 16/3/4.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "MyTextField.h"

@implementation MyTextField

//重写绘制行为
//除了UITextField对象的风格选项，你还可以定制化UITextField对象，为他添加许多不同的重写方法，来改变文本字段的显示行为。这些方法都会返回一个CGRect结构，制定了文本字段每个部件的边界范围。以下方法都可以重写。

//重写来重置文字区域
- (CGRect)textRectForBounds:(CGRect)bounds{
    return CGRectZero;
}
//改变绘文字属性.重写时调用super可以按默认图形属性绘制,若自己完全重写绘制函数，就不用调用super了.
- (void)drawTextInRect:(CGRect)rect{
}
//重写来重置占位符区域
- (CGRect)placeholderRectForBounds:(CGRect)bounds{
    return CGRectZero;
}
//重写改变绘制占位符属性.重写时调用super可以按默认图形属性绘制,若自己完全重写绘制函数，就不用调用super了.
- (void)drawPlaceholderInRect:(CGRect)rect{
}

//重写来重置边缘区域
- (CGRect)borderRectForBounds:(CGRect)bounds{
    return CGRectZero;
}
//重写来重置编辑区域
- (CGRect)editingRectForBounds:(CGRect)bounds{
    return CGRectZero;
}
//重写来重置clearButton位置,改变size可能导致button的图片失真
-(CGRect)clearButtonRectForBounds:(CGRect)bounds{
    return CGRectZero;
}

@end
