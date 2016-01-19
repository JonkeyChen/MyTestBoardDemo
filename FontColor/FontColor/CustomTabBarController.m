//
//  CustomTabBarController.m
//  FontColor
//
//  Created by Tianjian on 15/11/19.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "CustomTabBarController.h"

@implementation CustomTabBarController

- (instancetype)init{
    if (self = [super init]) {
        self.tabBar.barTintColor = [UIColor redColor];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        self.tabBar.barTintColor = [UIColor colorWithRed:71/255.0 green:179/255.0 blue:90/255.0 alpha:1];
        self.tabBar.tintColor = [UIColor whiteColor];
    }
    return self;
}


@end
