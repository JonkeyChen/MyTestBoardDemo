//
//  JSLoadOC.m
//  UIKit_UIWebView
//
//  Created by Tianjian on 16/3/8.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "JSLoadOC.h"
#import <JavaScriptCore/JavaScriptCore.h> 
#import "JSObject.h"

@interface JSLoadOC ()<UIWebViewDelegate>

@property (strong,nonatomic) UIWebView *webView;

@end

@implementation JSLoadOC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initWebView];
}

- (void)initWebView{
    _webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    
    [self.view addSubview:_webView];
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    JSContext *context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    JSObject *testJSObject = [[JSObject alloc]init];
    context[@"JSObject"] = testJSObject;
    [context evaluateScript:@"testJSObject.TestNOParmeter()"];
    [context evaluateScript:@"testJSObject.TestOneParmeter('参数A')"];
    [context evaluateScript:@"testJSObject.TestTwoParmetersecondParmeter('参数A','参数B')"];
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    
}

@end
