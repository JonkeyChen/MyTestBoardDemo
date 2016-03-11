//
//  OCLoadJS.m
//  UIKit_UIWebView
//
//  Created by Tianjian on 16/3/8.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "OCLoadJS.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface OCLoadJS ()<UIWebViewDelegate>

@property (nonatomic,strong) UIWebView *webView;

@end

@implementation OCLoadJS

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self initWebView];
}
- (void)initWebView{
    //1.初始化
    _webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    
    //2.设置几本属性
    _webView.backgroundColor = [UIColor greenColor];//设置背景颜色，需要关闭opaque
    _webView.opaque = NO;
    
    //2.加载资源
    
    //2.1加载 http://www.baidu.com
    //NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    //[_webView loadRequest:request];
    
    //2.2加载html
    NSString *path = [[NSBundle mainBundle]pathForResource:@"2" ofType:@"html"];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
    
    //2.3
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"3" ofType:@"js"];
    NSString *jsString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [_webView stringByEvaluatingJavaScriptFromString:jsString];
    
    //3.添加到控制器上
    [self.view addSubview:_webView];
    
    //4.设置委托
    _webView.delegate  = self;
    
    NSArray<NSString*> *arrTitle = @[@"方式－",@"方式二",@"方式三",@"方式四"];
    [arrTitle enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button = [[UIButton alloc] init];
        button.frame = CGRectMake(idx * [UIScreen mainScreen].bounds.size.width/arrTitle.count, [UIScreen mainScreen].bounds.size.height - 40,[UIScreen mainScreen].bounds.size.width/arrTitle.count, 40);
        button.tag = idx;
        [button addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor orangeColor]];
        [button setTitle:obj forState:UIControlStateNormal];
        [self.view addSubview:button];
    }];
}
- (void)actionClick:(UIButton*)button{

    if (button.tag == 0) {
        //方法1：预加载的test.js内部已经写了addNewNodeTest()方法，这里只需注入"addNewNodeTest()"字符串即可
        [self.webView stringByEvaluatingJavaScriptFromString:@"addNewNodeTest()"];
    } else if (button.tag == 1){
        //方法2：把test.js内部的addNewNodeTest()方法复制过来，去掉行与行之间的空格
        //字符串双引号要么前面加转义符"\",要么变成单引号，例如：
        NSString *addNewNode = @"var para = document.createElement(\"p\");var node=document.createTextNode('这是新段落。');para.appendChild(node);var element=document.getElementById('addNewNodeTest');element.appendChild(para);";
        [self.webView stringByEvaluatingJavaScriptFromString:addNewNode];
    } else if(button.tag == 2){
        //方法3：把test.js内部的addNewNodeTest()方法复制过来，并在每一行首尾加上双引号（跟方法2差不多）
        NSString *addNewNode =
        @"var para = document.createElement('p');"
        "var node = document.createTextNode('这是新段落。');"
        "para.appendChild(node);"
        "var element = document.getElementById('addNewNodeTest');"
        "element.appendChild(para);";
        [self.webView stringByEvaluatingJavaScriptFromString:addNewNode];
    } else {
        [self.webView stringByEvaluatingJavaScriptFromString:@"changeUILabelText"];
    }
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSLog(@"开始加载...");
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"完成加载...");
    NSString *sendJsStr = [NSString stringWithFormat:@"openFile(\"%@\")",@"jsDocPathString"];
    [webView stringByEvaluatingJavaScriptFromString:sendJsStr];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    NSLog(@"%@",sendJsStr);
    NSLog(@"%@",[webView stringByEvaluatingJavaScriptFromString:@"document.title"]);
    
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    NSLog(@"加载失败...");
}

@end
