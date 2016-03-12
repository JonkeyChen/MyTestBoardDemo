//
//  GirdView.h
//  六宫格_切换图片
//
//  Created by Tianjian on 16/3/12.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GirdView;
@protocol GirdViewDelegate <NSObject>

- (void)GirdView:(GirdView*)gridView didDeleteIndex:(NSInteger)index;

- (void)GirdView:(GirdView *)gridView didAddImages:(UIEvent*)event;

- (void)GirdView:(GirdView *)gridView exChangeAtIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;

@end

@interface GirdView : UIView

- (instancetype)initGirdFrame:(CGRect)frame withItemSize:(CGSize)size;

@property (strong,nonatomic) NSArray<UIImage*> *images;

@property (assign,nonatomic) id<GirdViewDelegate>delegate;

@end
