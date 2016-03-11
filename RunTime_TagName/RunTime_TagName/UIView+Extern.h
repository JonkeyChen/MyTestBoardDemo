//
//  UIView+Extern.h
//  RunTime_TagName
//
//  Created by Tianjian on 16/3/7.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extern)

@property (copy,nonatomic) NSString *nameTag;

- (UIView*)viewWithNameTag:(NSString*)aName;

- (UIView*)viewNamed:(NSString*)aName;

@end
