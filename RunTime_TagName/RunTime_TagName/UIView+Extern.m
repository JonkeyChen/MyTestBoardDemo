//
//  UIView+Extern.m
//  RunTime_TagName
//
//  Created by Tianjian on 16/3/7.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "UIView+Extern.h"
#import <objc/runtime.h>

static const char nameTag_Key;

@implementation UIView (Extern)

- (id)nameTag{
    return  objc_getAssociatedObject(self, (void*)&nameTag_Key);
}

- (void)setNameTag:(NSString *)nameTag{
    objc_setAssociatedObject(self, (void*)&nameTag_Key, nameTag, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView*)viewWithNameTag:(NSString*)aName{
    if (!aName) return nil;
    
    if ([self.nameTag isEqualToString:aName]) {
        return self;
    }
    
    for (UIView *subView in self.subviews) {
        UIView *resultView = [subView viewWithNameTag:aName];
        if (resultView) {
            return resultView;
        }
    }
    return nil;
}
- (UIView*)viewNamed:(NSString*)aName{
    if (!aName) return nil;
    return [self viewWithNameTag:aName];
}

@end
