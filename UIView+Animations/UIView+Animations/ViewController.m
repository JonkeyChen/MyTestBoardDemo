//
//  ViewController.m
//  UIView+Animations
//
//  Created by Tianjian on 16/3/15.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>{
    BOOL isSingle;
}

@property (weak, nonatomic) IBOutlet UIImageView *evimg;

@property (nonatomic,strong) NSMutableArray<NSString*> *arrList;

@property (weak, nonatomic) IBOutlet UITableView *evtblList;

@end

static NSString *cellIndentifier = @"cellIndentifier";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _arrList = [[NSMutableArray alloc]initWithArray:@[@"旋转",
                                                      @"反转",
                                                      @"位移",
                                                      @"缩放",
                                                      @"Frame_Alpha",
                                                      @"",
                                                      @"",]];
    
    [_evtblList registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIndentifier];
    [_evtblList reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrList.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ + 动画",_arrList[indexPath.row]];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    isSingle = !isSingle;
    
    switch (indexPath.row) {
        case 0:{
            [self doRotate:_evimg ];//旋转
        }
            break;
        case 1:{
            [self doInvert:_evimg ];//反转
        }
            break;
        case 2:{
            [self doTranslate:_evimg ];//位移
        }
            break;
        case 3:{
            [self doScale:_evimg];//缩放
        }
            break;
        case 4:{
            [self doAnimationChangeFrame_Alpha:_evimg];
        }
        default:
            break;
    }
    
}

-(void)doRotate:(UIImageView*)bigImage{//旋转
    CGAffineTransform transform= isSingle?CGAffineTransformMakeRotation(M_PI):CGAffineTransformIdentity;
    
    [UIView beginAnimations:nil context:nil];
    bigImage.transform = transform;
    [UIView commitAnimations];
}

-(void)doInvert:(UIImageView*)bigImage{//反转
    //如果单次 直接翻转到原始状态 如果连续 在以前基础上再次进行反转
    
    CGAffineTransform transform = isSingle?CGAffineTransformInvert(bigImage.transform):CGAffineTransformIdentity;
    
    [UIView beginAnimations:nil context:nil];
    bigImage.transform = transform;
    [UIView commitAnimations];
}

-(void)doTranslate:(UIImageView*)bigImage //位移
{
    //如果单次 只改变一次 如果连续 在以前基础上再次进行移位
    CGAffineTransform transform = isSingle?CGAffineTransformMakeTranslation(130, 30):CGAffineTransformTranslate(bigImage.transform, 10, 10);
    
    //    [UIView beginAnimations:nil context:nil];
    //    bigImage.transform = transform;
    //    [UIView commitAnimations];
    [UIView animateWithDuration:1 animations:^{
        bigImage.transform = transform;
    }];
}

-(void)doScale:(UIImageView*)bigImage {//缩放
    //如果单次 只改变一次 如果连续 在以前基础上再次进行缩放
    CGAffineTransform transform = isSingle?CGAffineTransformMakeScale(1.0, 1.1):CGAffineTransformScale(bigImage.transform, 1.0, 1.1);
    [UIView beginAnimations:nil context:nil];
    bigImage.transform = transform;
    [UIView commitAnimations];
}

- (void)doAnimationChangeFrame_Alpha:(UIImageView*)bigImage{
    
    /**⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️动画配置⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️**/
    // default = nil.  默认为nil
    //+ (void)setAnimationDelegate:(nullable id)delegate;
    
    // default = NULL. 需要设置(⭐️)delegate
    //+ (void)setAnimationWillStartSelector:(nullable SEL)selector;
    
    // default = NULL. 需要设置(⭐️)delegate
    //+ (void)setAnimationDidStopSelector:(nullable SEL)selector;
    
    // default = NULL. 需要设置(⭐️)delegate
    //+ (void)setAnimationDuration:(NSTimeInterval)duration;
    
    // default = 0.0.  延时动画时间
    //+ (void)setAnimationDelay:(NSTimeInterval)delay;
    
    // default = now.  设置某个时间点触发（默认当前时间点）
    //+ (void)setAnimationStartDate:(NSDate *)startDate;
    
    // default = UIViewAnimationCurveEaseInOut
    //+ (void)setAnimationCurve:(UIViewAnimationCurve)curve;
    
    // default = 0.0.  重复动画次数
    //+ (void)setAnimationRepeatCount:(float)repeatCount;
    
    /**⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️**/
    
    /********************动画控制的枚举(UIViewAnimationCurve)***************************/
    UIViewAnimationCurveEaseInOut   ;//渐入，渐出
    UIViewAnimationCurveEaseIn      ;//渐入
    UIViewAnimationCurveEaseOut     ;//监测
    UIViewAnimationCurveLinear      ;//
    /*********************************************************************************/


    //1.动画方式一：
    //[UIView beginAnimations:@"animationID" context:nil];  //1.开始动画 ⭐️⭐️⭐️⭐️（开始主要点）
    
    //[UIView setAnimationDuration:2];
    //[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    ///************************3.动画属性方式等配置******************************/
    //CGRect frame = bigImage.frame;
    //if (isSingle) {
        //frame.origin.x +=200;
        //frame.origin.y +=60;
        //bigImage.alpha  = 0.5;
    //} else {
        //frame.origin.x -=200;
        //frame.origin.y -=60;
        //bigImage.alpha  = 1;
    //}
    //bigImage.frame = frame;
    ///**************************动画属性方式等配置******************************/
    //[UIView commitAnimations];//2.开始提交动画 ⭐️⭐️⭐️⭐️（结束主要点）
    
    //2.动画方式二：
    /**⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️Block块执行动画⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️**/
    //动画时间，执行动画(block块)
    //+ (void)animateWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations ; // delay = 0.0, options = 0, completion = NULL
    
    //动画时间，执行动画(block块)，完成后的操作（block块）
    //+ (void)animateWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion ;
    
    //动画时间，动画延迟开始时间，动画行动方式，执行动画(block块)，完成后的操作（block块）
    //+ (void)animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion ;
    
    //动画时间，动画延迟开始时间，动画行动方式，执行动画(block块)，完成后的操作（block块）
    /**特别介绍（⭐️⭐️⭐️）
     1.usingSpringWithDamping: 阻尼(弹簧动画)相当于摩擦力的大小，范围:[0.0 ~ 1.0]
     说明：a.靠近 0，阻尼小，弹动幅度大 ; b.靠近 1，阻尼大，弹动幅度小
     
     2.initialSpringVelocity:弹簧动画的速率
     说明: a. initialSpringVelocity ＝ 0，表示忽略改属性，只计算阻尼＋动画效果
          b. initialSpringVelocity  > 0，表示 值越小，弹簧拉伸幅度小； 
                                             值越大，弹动拉伸幅度越大;
     
     */
    //+ (void)animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay usingSpringWithDamping:(CGFloat)dampingRatio initialSpringVelocity:(CGFloat)velocity options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion ;
    /**⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️**/
    
    //[UIView animateWithDuration:1      //执行时间
                          //delay:0.0    //延迟执行时间
                        //options:UIViewAnimationOptionCurveEaseInOut//执行方式
                     //animations:^{     //开始操作
         //CGRect frame = bigImage.frame;
         //if (!isSingle) {
             //frame.origin.x +=200;
             //frame.origin.y +=60;
             //bigImage.alpha  = 0.5;
         //} else {
             //frame.origin.x -=200;
             //frame.origin.y -=60;
             //bigImage.alpha  = 1;
         //}
         //bigImage.frame = frame;
    //} completion:^(BOOL finished) {  //操作结束
        //NSLog(@"动画完成后，需要执行的操作");
    //}];
   
    [UIView animateWithDuration:1.0
                          delay:0.0
         usingSpringWithDamping:0.9
          initialSpringVelocity:20
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
         CGRect frame = bigImage.frame;
         if (isSingle) {
             frame.origin.x +=200;
             frame.origin.y +=60;
             bigImage.alpha  = 0.5;
         } else {
             frame.origin.x -=200;
             frame.origin.y -=60;
             bigImage.alpha  = 1;
         }
         bigImage.frame = frame;
    } completion:^(BOOL finished) {
        
    }];
    
}


@end
