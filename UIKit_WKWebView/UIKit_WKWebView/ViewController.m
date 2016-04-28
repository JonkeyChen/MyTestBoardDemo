//
//  ViewController.m
//  UIKit_WKWebView
//
//  Created by Tianjian on 16/3/16.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()<WKNavigationDelegate,WKUIDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * url = [NSString stringWithFormat:@"http://weixin.release.1yd.me/main.html#/match/index?nativeToken=%@",@"bearer%20e7bbbdb7-8530-4445-998e-85f8d321f25d"];
    
    //[self initWebView:url];
    [self initWKWebView:url];
}

- (void)initWebView:(NSString*)url{
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [webView loadRequest:request];
    [self.view addSubview:webView];
}
- (void)initWKWebView:(NSString*)url{
    //1.引入 <WebKit/WebKit.h>
    
    //2.加载页面
    WKWebViewConfiguration *configure = [[WKWebViewConfiguration alloc]init];
    
    //3.初始化
    WKWebView *wkWebView = [[WKWebView alloc]initWithFrame:self.view.frame configuration:configure];
    //wkWebView.navigationDelegate = self;
    //wkWebView.UIDelegate = self;
    wkWebView.allowsBackForwardNavigationGestures = YES;
    [self.view addSubview:wkWebView];
    
    //4.加载
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [wkWebView loadRequest:request];
}

@end
