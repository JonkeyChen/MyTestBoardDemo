//
//  CALayerView.h
//  CALayer01
//
//  Created by Tianjian on 15/11/26.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CALayerView : UIView{
    CAShapeLayer *layer;
}

- (void)strokeStart:(CGFloat)value;
- (void)strokeEnd:(CGFloat)value;


@end
