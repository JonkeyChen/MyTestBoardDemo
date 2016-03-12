//
//  ViewController.m
//  六宫格_切换图片
//
//  Created by Tianjian on 16/3/12.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "ViewController.h"
#import "GirdView.h"

@interface ViewController ()<GirdViewDelegate>

@end

@implementation ViewController{
    NSMutableArray<UIImage*> *arrImage1;
    NSMutableArray<UIImage*> *arrImage2;
    NSMutableArray<UIImage*> *arrImage3;
    NSMutableArray<UIImage*> *arrImage4;
    NSMutableArray<UIImage*> *arrImage5;
    NSMutableArray<UIImage*> *arrImage6;
    GirdView *evGirdView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    arrImage1 = [[NSMutableArray alloc]initWithArray:@[[UIImage imageNamed:@"1.png"]]];
    
    arrImage2 = [[NSMutableArray alloc]initWithArray:@[[UIImage imageNamed:@"1.png"],
                                                       [UIImage imageNamed:@"2.png"]]];
    
    arrImage3 = [[NSMutableArray alloc]initWithArray:@[[UIImage imageNamed:@"1.png"],
                                                       [UIImage imageNamed:@"2.png"],
                                                       [UIImage imageNamed:@"3.png"]]];
    
    arrImage4 = [[NSMutableArray alloc]initWithArray:@[[UIImage imageNamed:@"1.png"],
                                                       [UIImage imageNamed:@"1.png"],
                                                       [UIImage imageNamed:@"1.png"],
                                                       [UIImage imageNamed:@"1.png"]]];
    
    arrImage5 = [[NSMutableArray alloc]initWithArray:@[[UIImage imageNamed:@"5.png"],
                                                       [UIImage imageNamed:@"4.png"],
                                                       [UIImage imageNamed:@"3.png"],
                                                       [UIImage imageNamed:@"5.png"],
                                                       [UIImage imageNamed:@"1.png"]]];
    
    arrImage6 = [[NSMutableArray alloc]initWithArray:@[[UIImage imageNamed:@"1.png"],
                                                       [UIImage imageNamed:@"2.png"],
                                                       [UIImage imageNamed:@"3.png"],
                                                       [UIImage imageNamed:@"4.png"],
                                                       [UIImage imageNamed:@"5.png"],
                                                       [UIImage imageNamed:@"6.png"]]];
    
    
    evGirdView = [[GirdView alloc]initGirdFrame:CGRectMake(10, 100, 300+40, 300+40) withItemSize:CGSizeMake(100, 100)];
    evGirdView.images = @[];
    //girdView.images = arrImage1;
    evGirdView.images = arrImage2;
    //girdView.images = arrImage3;
    //girdView.images = arrImage4;
    //girdView.images = arrImage5;
    evGirdView.images = arrImage6;
    evGirdView.delegate = self;
    [self.view addSubview:evGirdView];
}
- (void)GirdView:(GirdView *)gridView didDeleteIndex:(NSInteger)index{
    NSLog(@"%@",@(index));
    [arrImage6 removeObjectAtIndex:index];
    gridView.images = arrImage6;
}
- (void)GirdView:(GirdView *)gridView didAddImages:(UIEvent *)event{
    NSLog(@"添加图片");
    gridView.images = arrImage6;
}
- (void)GirdView:(GirdView *)gridView exChangeAtIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex{
    NSLog(@"from index (%@) to index (%@)",@(fromIndex),@(toIndex));
    [arrImage6 exchangeObjectAtIndex:fromIndex withObjectAtIndex:toIndex];
    gridView.images = arrImage6;
}

@end
