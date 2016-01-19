//
//  YMDrawView.h
//  Second
//
//  Created by YM on 15/11/18.
//  Copyright © 2015年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YMDrawView;
@protocol YMDrawViewDelegate <NSObject>

- (void)yMDrawView:(YMDrawView *)ymDrawView image:(UIImage *)cutImage;

@end

@interface YMDrawView : UIView
{
       CAShapeLayer *refractLineLayer;
}

/**坐标轴线的宽度*/
@property (nonatomic,assign) CGFloat coordinateAxisLineWidth;

/**折线的宽度*/
@property (nonatomic,assign) CGFloat refractLineWidth;

/**Y坐标轴间距*/
@property (nonatomic,assign) CGFloat yCoordinateSpace;

/**X坐标轴间距*/
@property (nonatomic,assign) CGFloat xCoordinateSpace;

/**小字体*/
@property (nonatomic) UIFont *smallFont ;

/**大字体*/
@property (nonatomic) UIFont *bigFont ;


/**绘图显示的Frame*/
@property (nonatomic) CGRect showFrame;

/**动画时间 duration*/
@property (nonatomic,assign) CGFloat duration;
/**是否开启动画*/
@property (nonatomic,assign) BOOL isAnimated;

/**小圆的半径*/
@property (nonatomic,assign) CGFloat refractLineRadius;


@property (nonatomic,strong) NSArray *xArray;
@property (nonatomic,strong) NSArray *yArray;

@property (nonatomic,weak) id<YMDrawViewDelegate> delegate;;

- (void)showInfo;


@end
