//
//  FMTools.h
//  FMDataBase
//
//  Created by 林梦夕 on 15/6/24.
//  Copyright (c) 2015年 林梦夕. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMModel;

@interface FMTools : NSObject


+ (void)addModel:(FMModel *)model;

+ (NSMutableArray *)modelArray;

+ (void)changeModel:(NSInteger)number;

@end
