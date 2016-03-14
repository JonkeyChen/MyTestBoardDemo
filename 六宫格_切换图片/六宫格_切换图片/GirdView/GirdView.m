//
//  GirdView.m
//  六宫格_切换图片
//
//  Created by Tianjian on 16/3/12.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "GirdView.h"


#define GirdViewScreenWidth  [UIScreen mainScreen].bounds.size.width
#define GirdViewScreenHeight [UIScreen mainScreen].bounds.size.height

@interface GirdView ()

@property (assign,nonatomic) CGFloat width;

@property (assign,nonatomic) CGSize itemSize;

@property (assign,nonatomic) CGFloat paddding;

@property (strong,nonatomic) NSMutableArray<UIButton*> *arrButtons;

@property (strong,nonatomic) NSMutableArray<NSValue*> *arrRects;

@property (assign,nonatomic) BOOL isStartSwithImage;

@property (assign,nonatomic) NSInteger startPressIndex;
@property (assign,nonatomic) NSInteger endPressIndex;

@end

@implementation GirdView

- (instancetype)initGirdFrame:(CGRect)frame withItemSize:(CGSize)size{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor greenColor];
        _paddding = 10;
        _itemSize = size;
        _width = _itemSize.width;
        _arrRects = [[NSMutableArray alloc]init];
        
        CGRect frame = self.frame;
        frame.size.width  = _itemSize.width*3  + _paddding*4;
        frame.size.height = _itemSize.height*3 + _paddding*4;
        self.frame = frame;
    }
    return self;
}


- (void)setImages:(NSArray<UIImage*> *)images{
    for (id  v in self.subviews) {
        [v removeFromSuperview];
    }
    [_arrRects removeAllObjects];
    
    NSMutableArray<UIImage*> *arrSubImages = [[NSMutableArray alloc]init];
    [arrSubImages addObjectsFromArray:images];
    [arrSubImages addObject:[UIImage imageNamed:@"iconMyAddPicture.png"]];
    
    [arrSubImages enumerateObjectsUsingBlock:^(UIImage * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat origin_X = (_paddding+_width)*(idx%3)+_paddding;
        CGFloat origin_Y = (_paddding+_width)*(idx/3)+_paddding;
        
        UIImageView *etimag = [[UIImageView alloc]init];
        etimag.userInteractionEnabled = YES;
        etimag.frame = CGRectMake(origin_X, origin_Y, _width, _width);
        etimag.tag   = 1000+idx;
        etimag.image = obj;
        [self addSubview:etimag];
        
        UIButton *etbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [etbtn setTitle:@"x" forState:UIControlStateNormal];
        [etbtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [etbtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [self addSubview:etbtn];
        
        if (obj == [arrSubImages lastObject]) {
            etbtn.frame = CGRectMake(origin_X, origin_Y, _width, _width);
            [etbtn setTitle:@"" forState:UIControlStateNormal];
            [etbtn setBackgroundImage:obj forState:UIControlStateNormal];
            etbtn.tag = 100;
            [etbtn addTarget:self action:@selector(_efOnClickAdd:withEvent:) forControlEvents:UIControlEventTouchUpInside];
        } else {//图片
            etbtn.frame = CGRectMake(origin_X+_width-25, origin_Y, 25, 25);
            etbtn.tag = idx;
            [etbtn addTarget:self action:@selector(_efOnClickDelete:withEvent:) forControlEvents:UIControlEventTouchUpInside];
            
            [_arrRects addObject:[NSValue valueWithCGRect:etimag.frame]];
        }
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _isStartSwithImage = YES;
    UITouch *touch = [[touches allObjects] lastObject];
    CGPoint point = [touch locationInView:self];
    
    for (int i = 0; i<_arrRects.count; i++) {
        CGRect rect = [_arrRects[i] CGRectValue];
        if (CGRectContainsPoint(rect, point)) {
            _startPressIndex = i;
        }
    }
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (_isStartSwithImage) {
        UITouch *touch = [[touches allObjects] lastObject];
        CGPoint point = [touch locationInView:self];
        
        BOOL isChange = NO;
        for (int i = 0; i<_arrRects.count; i++) {
            CGRect rect = [_arrRects[i] CGRectValue];
            if (CGRectContainsPoint(rect, point)) {
                _endPressIndex = i;
                isChange = YES;
            }
        }
        if (!isChange) {
            return;
        }
        _isStartSwithImage = NO;
        if ([self.delegate respondsToSelector:@selector(GirdView:exChangeAtIndex:toIndex:)]) {
            [self.delegate GirdView:self exChangeAtIndex:_startPressIndex toIndex:_endPressIndex];
        }
    }
}


//ClickAction
- (void)_efOnClickAdd:(UIButton*)sender withEvent:(UIEvent*)event{
    UITouch *touch = [[event allTouches]anyObject];
    if (touch.tapCount >1) {
        return;
    }
    if ([self.delegate respondsToSelector:@selector(GirdView:didAddImages:)]) {
        [self.delegate GirdView:self didAddImages:event];
    }
    
}
- (void)_efOnClickDelete:(UIButton*)sender withEvent:(UIEvent*)event{
    UITouch *touch = [[event allTouches]anyObject];
    if (touch.tapCount >1) {
        return;
    }
    if ([self.delegate respondsToSelector:@selector(GirdView:didDeleteIndex:)]) {
        [self.delegate GirdView:self didDeleteIndex:sender.tag];
    }
}


@end
