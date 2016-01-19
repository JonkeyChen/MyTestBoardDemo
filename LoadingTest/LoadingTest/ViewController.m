//
//  ViewController.m
//  LoadingTest
//
//  Created by Tianjian on 15/11/20.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "ViewController.h"
#import "Loading.h"

#import <ImageIO/ImageIO.h>
#import <UIImage+GIF.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *evimage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.evimage.layer.masksToBounds = YES;
    self.evimage.layer.borderColor = [UIColor redColor].CGColor;
    self.evimage.layer.borderWidth = 2;
}
- (IBAction)_show:(id)sender {
}
- (IBAction)yyy:(id)sender {
    self.evimage.image = nil;
}

- (IBAction)xxxx:(id)sender {
    self.evimage.image = [UIImage sd_animatedGIFNamed:@"10"];
}
- (void)_efShowImages{
    self.evimage.animationDuration = 2;
    self.evimage.animationImages   = @[[UIImage imageNamed:@"1.png"],[UIImage imageNamed:@"2.png"],[UIImage imageNamed:@"3.png"],[UIImage imageNamed:@"4.png"],];//images;
    [self.evimage startAnimating];
}

@end
