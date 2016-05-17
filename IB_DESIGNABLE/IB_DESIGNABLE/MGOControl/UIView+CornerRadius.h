//
//  UIView+CornerRadius.h
//  IB_DESIGNABLE
//
//  Created by Tianjian on 16/5/17.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MGOTextField : UITextField
@end

@interface MGOLabel     : UILabel
@end

@interface MGOImageView : UIImageView
@end

@interface MGOButton    : UIButton
@end

@interface MGOView      : UIView
@end

IB_DESIGNABLE
@interface UIView (CornerRadius)

@property (assign,nonatomic) IBInspectable CGFloat  cornerRadius;
@property (assign,nonatomic) IBInspectable CGFloat  borderWidth;
@property (assign,nonatomic) IBInspectable UIColor *borderColor;
@property (assign,nonatomic) IBInspectable CGFloat  defineValue;

@end
