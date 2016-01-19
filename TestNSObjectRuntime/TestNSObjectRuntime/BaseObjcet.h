//
//  BaseObjcet.h
//  TestNSObjectRuntime
//
//  Created by Tianjian on 15/11/19.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseObjcet : NSObject

@property (copy,nonatomic) NSString *name;
@property (strong,nonatomic) NSNumber *number;
@property (strong,nonatomic) NSArray * arrary;


@end
