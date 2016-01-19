//
//  OpenCityDTO.h
//  TestArchiveAndUnArchive
//
//  Created by Tianjian on 16/1/4.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityDTO : NSObject<NSCoding>

@property (copy,nonatomic) NSString *userName;

@end

@interface OpenCityDTO : NSObject<NSCoding>

@property (strong,nonatomic) NSArray *cities;

@end
