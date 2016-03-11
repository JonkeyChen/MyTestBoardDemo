//
//  JSObject.h
//  UIKit_UIWebView
//
//  Created by Tianjian on 16/3/8.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JSObject;

@protocol JSObjectProtocol <NSObject>

- (void)TestNOParmeter;
- (void)TestOneParmeter:(NSString*)message;
- (void)TestTwoParmeter:(NSString*)message secondParmeter:(NSString*)otherMessage;

@end

@interface JSObject : NSObject<JSObjectProtocol>



@end
