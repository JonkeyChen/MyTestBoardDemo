//
//  UITextField+Blocks.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Blocks)

/**
 *  即将开始编辑
 */
@property (copy, nonatomic) BOOL (^shouldBegindEditingBlock)(UITextField *textField);
/**
 *  即将结束编辑
 */
@property (copy, nonatomic) BOOL (^shouldEndEditingBlock)(UITextField *textField);
/**
 *  已经开始编辑
 */
@property (copy, nonatomic) void (^didBeginEditingBlock)(UITextField *textField);
/**
 *  已经结束编辑
 */
@property (copy, nonatomic) void (^didEndEditingBlock)(UITextField *textField);
/**
 *  正在编辑中
 */
@property (copy, nonatomic) BOOL (^shouldChangeCharactersInRangeBlock)(UITextField *textField, NSRange range, NSString *replacementString);
/**
 *  即将点击return
 */
@property (copy, nonatomic) BOOL (^shouldReturnBlock)(UITextField *textField);
/**
 *  即将点击clearButton
 */
@property (copy, nonatomic) BOOL (^shouldClearBlock)(UITextField *textField);
- (void)setShouldBegindEditingBlock:(BOOL (^)(UITextField *textField))shouldBegindEditingBlock;
- (void)setShouldEndEditingBlock:(BOOL (^)(UITextField *textField))shouldEndEditingBlock;
- (void)setDidBeginEditingBlock:(void (^)(UITextField *textField))didBeginEditingBlock;
- (void)setDidEndEditingBlock:(void (^)(UITextField *textField))didEndEditingBlock;
- (void)setShouldChangeCharactersInRangeBlock:(BOOL (^)(UITextField *textField, NSRange range, NSString *string))shouldChangeCharactersInRangeBlock;
- (void)setShouldClearBlock:(BOOL (^)(UITextField *textField))shouldClearBlock;
- (void)setShouldReturnBlock:(BOOL (^)(UITextField *textField))shouldReturnBlock;

@end