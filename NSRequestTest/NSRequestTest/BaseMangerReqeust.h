//
//  BaseMangerReqeust.h
//  NSRequestTest
//
//  Created by Tianjian on 15/12/7.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface BaseMangerReqeust : NSObject


+ (void)PostRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para withBody:(NSDictionary *)body success:(void (^)(id))success failure:(void (^)(id))failure;

+ (void)GetRequest:(NSMutableURLRequest*)request success:(void(^)(id response))success;

+ (void)GetRequest:(NSMutableURLRequest*)request withHeaderFields:(NSDictionary*)fields success:(void(^)(id response))success;

/**
 */
+ (void)GetRequestWithUrl:(NSString*)url withBody:(NSDictionary*)parm withHeaderFields:(NSDictionary*)fields success:(void(^)(BOOL success,id response))success;

@end
