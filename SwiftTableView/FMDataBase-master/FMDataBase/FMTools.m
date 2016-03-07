//
//  FMTools.m
//  FMDataBase
//
//  Created by 林梦夕 on 15/6/24.
//  Copyright (c) 2015年 林梦夕. All rights reserved.
//

#import "FMTools.h"
#import "FMDB.h"
#import "FMModel.h"

@interface FMTools ()

//@property (nonatomic,strong) FMDatabase *data;


@end

@implementation FMTools

static FMDatabase *_data;

+ (void)initialize {
    
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"car.sqlite"];
    _data = [FMDatabase databaseWithPath:path];
    if ([_data open]) {
        
        [_data executeUpdate:@"CREATE TABLE IF NOT EXISTS WashCar (shopId integer, content text, discountPic text, id integer, price integer, workerNum integer, sellNum integer, type integer, name text, state integer, selected integer)"];

    } else {
        
        NSLog(@"打开失败");
        return;
        
    }
    
    
}

//- (id)init {
//    
//    self = [super init];
//    if (self) {
//        
//        NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//        _data = [FMDatabase databaseWithPath:path];
//        if ([_data open]) {
//            
//            [_data executeUpdate:@"CREATE TABLE IF NOT EXISTS WashCar (shopId integer, content text, discountPic text, id integer, price integer, workerNum integer, sellNum integer, type integer, name text, state bool, selected bool)"];
//            
//        } else {
//            
//            NSLog(@"打开失败");
//            
//        }
//
//    }
//    
//    return self;
//    
//}
+ (void)addModel:(FMModel *)model {
    
   
    if ([_data open]) {
        
//         [_data executeUpdate:@" INSERT INTO WashCar (shopId, content, discountPic, id, price, workerNum, sellNum, type, name, state , selected) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",model.shopId, model.content, model.discountPic, model.id, model.price, model.workerNum, model.sellNum, model.type, model.name, model.state, model.selected];
        
        [_data executeUpdate:@" INSERT INTO WashCar (shopId, content, discountPic, id, price, workerNum, sellNum, type, name, state , selected) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",[NSNumber numberWithInteger:model.shopId], model.content, model.discountPic, [NSNumber numberWithInteger:model.id], [NSNumber numberWithInteger:model.price], [NSNumber numberWithInteger:model.workerNum], [NSNumber numberWithInteger:model.sellNum], [NSNumber numberWithInteger:model.type], model.name, [NSNumber numberWithInteger:model.state], [NSNumber numberWithInteger:model.selected]];

        
    }
   
    
}

+ (NSMutableArray *)modelArray {
    
    FMResultSet *set = [_data executeQuery:@"SELECT * FROM WashCar"];
    
    NSMutableArray *array = [NSMutableArray array];
    while (set.next) {
        
        FMModel *model = [[FMModel alloc] init];
//        NSInteger shopId = [set intForColumn: @"shopId"];
//        NSString *content = [set stringForColumn:@"content"];
//        NSString *discountPic = [set stringForColumn:@"discountPic"];
//        NSInteger id = [set intForColumn:@"id"];
//        NSInteger price = [set intForColumn:@"price"];
//        NSInteger workNum = [set intForColumn:@"workerNum"];
//        NSInteger sellNum = [set intForColumn:@"sellNum"];
//        NSInteger type = [set intForColumn:@"type"];
//        NSString *name = [set stringForColumn:@"name"];
//        NSInteger state = [set intForColumn:@"state"];
//        NSInteger selected = [set intForColumn:@"selected"];
        
        model.shopId = [set intForColumn: @"shopId"];
        model.content = [set stringForColumn:@"content"];
        model.discountPic = [set stringForColumn:@"discountPic"];
        model.id = [set intForColumn:@"id"];
        model.price = [set intForColumn:@"price"];
        model.workerNum = [set intForColumn:@"workerNum"];
        model.sellNum = [set intForColumn:@"sellNum"];
        model.type = [set intForColumn:@"type"];
        model.name = [set stringForColumn:@"name"];
        model.state = [set intForColumn:@"state"];
        model.selected = [set intForColumn:@"selected"];
        
        [array addObject:model];
        
    }
    
    return array;
    
}

+ (void)changeModel:(NSInteger)number {
    
    BOOL change = [_data executeUpdate:@"UPDATE WashCar SET  selected = ? WHERE id = ?",[NSNumber numberWithInteger:1],[NSNumber numberWithInteger:number]];
    
    if (change) {
        
        NSLog(@"成功");
        
    } else {
        
        NSLog(@"失败");

    }
}
@end
