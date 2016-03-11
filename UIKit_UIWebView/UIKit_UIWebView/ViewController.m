//
//  ViewController.m
//  UIKit_UIWebView
//
//  Created by Tianjian on 16/3/8.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "ViewController.h"
#import "OCLoadJS.h"
#import "JSLoadOC.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController ()<UIWebViewDelegate>

@property (nonatomic,strong) UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initWebView];
}

- (void)initWebView{
    //1.初始化
    _webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    
    //2.设置几本属性
    //_webView.backgroundColor = [UIColor greenColor];//设置背景颜色，需要关闭opaque
    //_webView.opaque = NO;
    
    //3.加载资源
    
    //3.1加载 http://www.baidu.com
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    [_webView loadRequest:request];
    
    //4.添加到控制器上
    [self.view addSubview:_webView];
    
    //5.设置委托
    _webView.delegate  = self;
    
    NSArray<NSString*> *arrTitle = @[@"OC调JS",@"JS调OC",@"返回",@"前进"];
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
    NSLog(@"%@",button.currentTitle);
    if (button.tag == 2) {
        [_webView goBack];
    } else if (button.tag == 3){
        [_webView goForward];
    } else if (button.tag == 1){//JS调OC
        JSLoadOC *jsLoadOC = [[JSLoadOC alloc]init];
        [self.navigationController pushViewController:jsLoadOC animated:YES];
    } else {//OC调JS
        OCLoadJS *ocLoadsJS = [[OCLoadJS alloc]init];
        [self.navigationController pushViewController:ocLoadsJS animated:YES];
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
    
    /***************************************************************************************************************************/
    //1.获取当前页面的url
    NSString *currentURL = [webView stringByEvaluatingJavaScriptFromString:@"document.location.href"];
    //2.获取页面title：
    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    //3.修改界面元素的值。(类似在google搜索关键字：“朱祁林”的功能)
    NSString *js_result = [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByName('q')[0].value='朱祁林';"];
    //4.表单提交：
    NSString *js_result2 = [webView stringByEvaluatingJavaScriptFromString:@"document.forms[0].submit(); "];
    //5.插入js代码
    [webView stringByEvaluatingJavaScriptFromString:@"var script = document.createElement('script');"
     "script.type = 'text/javascript';"
     "script.text = \"function myFunction() { "
     "var field = document.getElementsByName('q')[0];"
     "field.value='朱祁林';"
     "document.forms[0].submit();"
     "}\";"
     "document.getElementsByTagName('head')[0].appendChild(script);"];
    
    [webView stringByEvaluatingJavaScriptFromString:@"myFunction();"];
    
    /***************************************************************************************************************************/
    NSString *sendJsStr = [NSString stringWithFormat:@"openFile(\"%@\")",@"jsDocPathString"];
    [webView stringByEvaluatingJavaScriptFromString:sendJsStr];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    NSLog(@"%@",sendJsStr);
    
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    //JSContext *context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    //NSString *alertJs = @"alert('test js OC')"; //准备执行的js代码
    
    //[context evaluateScript:alertJs];//准备执行的js代码
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    NSLog(@"加载失败...");
}


@end
