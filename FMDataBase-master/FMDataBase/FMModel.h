//
//  FMModel.h
//  FMDataBase
//
//  Created by 林梦夕 on 15/6/24.
//  Copyright (c) 2015年 林梦夕. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMModel : NSObject

@property (nonatomic,assign) NSInteger shopId;
@property (nonatomic,copy) NSString *content;
@property (nonatomic,copy) NSString *discountPic;
@property (nonatomic,assign) NSInteger id;
@property (nonatomic,assign) NSInteger price;
@property (nonatomic,assign) NSInteger workerNum;
@property (nonatomic,assign) NSInteger sellNum;
@property (nonatomic,assign) NSInteger type;
@property (nonatomic,copy) NSString *name;
@property (nonatomic ,assign) NSInteger state;
@property (nonatomic,assign) NSInteger selected;

@end
