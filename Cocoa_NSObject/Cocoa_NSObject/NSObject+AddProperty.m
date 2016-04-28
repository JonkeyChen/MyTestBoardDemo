//
//  NSObject+AddProperty.m
//  Cocoa_NSObject
//
//  Created by Tianjian on 16/3/25.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "NSObject+AddProperty.h"
#import <objc/runtime.h>

static void* AddPropertyKey = @"AddProperty";

@implementation NSObject (AddProperty)

- (void)setHotName:(NSString *)hotName{
    objc_setAssociatedObject(self, &AddPropertyKey, hotName, OBJC_ASSOCIATION_COPY);
}
- (NSString *)hotName{
    NSString *hotNameStr = objc_getAssociatedObject(self, &AddPropertyKey);
    if ([hotNameStr isEqualToString:@""]||hotNameStr==nil||hotNameStr.length == 0) {
        return @"属性未赋值";
    } else {
        return hotNameStr;//objc_getAssociatedObject(self, &AddPropertyKey);
    }
}

@end
