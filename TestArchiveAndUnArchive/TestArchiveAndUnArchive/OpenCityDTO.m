//
//  OpenCityDTO.m
//  TestArchiveAndUnArchive
//
//  Created by Tianjian on 16/1/4.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "OpenCityDTO.h"

@implementation CityDTO
@synthesize userName;

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        userName = [aDecoder decodeObjectForKey:@"userName"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:userName forKey:@"userName"];
}

@end

@implementation OpenCityDTO
@synthesize cities;

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        cities = [aDecoder decodeObjectForKey:@"cities"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:cities forKey:@"cities"];
}

@end
