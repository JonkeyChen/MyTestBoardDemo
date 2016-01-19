//
//  BaseMangerReqeust.m
//  NSRequestTest
//
//  Created by Tianjian on 15/12/7.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "BaseMangerReqeust.h"

static const float defalutTimeOut = 10;


NSString *const Content_Type_String = @"Content-Type";//Header
NSString *const Application_Json    = @"application/json";//value
//X-MemberToken
/**

 POST /questions/:id/answers
 
 Request
 
 需要登录凭证
 Parameters:{
     id	问题标识
 }
 
 Body:
 
 {
 "content": "这是xxx",
 "photoIds": [11,12]
 }
 
 */
@implementation BaseMangerReqeust
+ (void)PostRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para withBody:(NSDictionary *)body success:(void (^)(id))success failure:(void (^)(id))failure{
    
}

+ (void)GetRequest:(NSMutableURLRequest*)request withHeaderFields:(NSDictionary*)fields success:(void(^)(id response))success{
}



+ (void)GetRequestWithUrl:(NSString*)url withBody:(NSDictionary*)parm withHeaderFields:(NSDictionary*)fields success:(void(^)(BOOL success,id response))success{
    //1.构造URL
    NSURL *Url = [NSURL URLWithString:url];
    //2.构造Request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:Url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    //3.设置POST请求
    [request setHTTPMethod:@"GET"];
    //4.设置超时
    //5.设置请求头
    //6.构造session
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            if (success) {
                //NSString *dataStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
                id response = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
                success(true,response);
            } else {
                success(false,error);
            }
        }
    }];
    //7.开始请求
    [task resume];
}

@end
