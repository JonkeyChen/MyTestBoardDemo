//
//  ViewController.m
//  TestArchiveAndUnArchive
//
//  Created by Tianjian on 16/1/4.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "ViewController.h"
#import "OpenCityDTO.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    OpenCityDTO *DTO = [[OpenCityDTO alloc]init];
    
    NSMutableArray *arr_Cities = [NSMutableArray array];
    for (int i = 0; i<6; i++) {
        CityDTO *cityDTO = [[CityDTO alloc]init];
        cityDTO.userName = [NSString stringWithFormat:@"张%d",i];
        
        [arr_Cities addObject:cityDTO];
    }
    DTO.cities = arr_Cities;

    [self _efWriteObjectToFiles:DTO withFilesPathName:@"xxxx" withKey:@"xxxx"];
}

- (void)_efWriteObjectToFiles:(id)obj withFilesPathName:(NSString*)filesPathName withKey:(NSString*)key{
    NSString *path = [self getFilePathWithFileName:filesPathName];
    BOOL success = [NSKeyedArchiver archiveRootObject:obj toFile:path];
    
    if (success) {
        [self _efReadObjectFromFilesWithFieldName:filesPathName andKey:key];
    }
}
- (void)_efReadObjectFromFilesWithFieldName:(NSString*)filesPathName andKey:(NSString*)key{
    OpenCityDTO *DTO = [NSKeyedUnarchiver unarchiveObjectWithFile:[self getFilePathWithFileName:filesPathName]];
    [DTO.cities enumerateObjectsUsingBlock:^(CityDTO * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%@",obj.userName);
    }];
}

- (NSString*)getFilePathWithFileName:(NSString*)fileName{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [[paths lastObject]stringByAppendingString:fileName];
    return path;
}

@end
