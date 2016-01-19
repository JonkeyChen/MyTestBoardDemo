//
//  ViewController.m
//  NSRequestTest
//
//  Created by Tianjian on 15/12/3.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "ViewController.h"
#import "BaseMangerReqeust.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [BaseMangerReqeust GetRequestWithUrl:@"http://thingx.duapp.com/tags/nature?skip=1&take=1" withBody:nil withHeaderFields:nil success:^(BOOL success, id response) {
        NSLog(@"\n%@",response);
    }];
    return;
    NSURL *url = [NSURL URLWithString:@"http://thingx.duapp.com/tags/nature?skip=1&take=1"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    [request setHTTPMethod:@"GET"];;
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSString *dataStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            
            NSLog(@"response = %@",dataStr);
        } else {
            NSString *dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"data: %@", dataStr);
        }
    }];
    [task resume];
}

@end
