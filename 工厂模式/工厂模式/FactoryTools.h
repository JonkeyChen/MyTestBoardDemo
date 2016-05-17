//
//  FactoryTools.h
//  工厂模式
//
//  Created by Tianjian on 16/4/28.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FactoryTools : NSObject

+ (void)efAddController:(UIViewController*)target WithLeftTitle:(NSString*)leftTitle withRightTile:(NSString*)rightTitle;

@end
