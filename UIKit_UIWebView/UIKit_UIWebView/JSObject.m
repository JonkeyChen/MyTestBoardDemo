//
//  JSObject.m
//  UIKit_UIWebView
//
//  Created by Tianjian on 16/3/8.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "JSObject.h"

@implementation JSObject
- (void)TestNOParmeter{
    NSLog(@"This is ios TestNoParmeter");
}
- (void)TestOneParmeter:(NSString*)message{
    NSLog(@"This is ios TestOneParmeter");

}
- (void)TestTwoParmeter:(NSString*)message secondParmeter:(NSString*)otherMessage{
    NSLog(@"This is ios TestTwoParmeter");
}
@end
