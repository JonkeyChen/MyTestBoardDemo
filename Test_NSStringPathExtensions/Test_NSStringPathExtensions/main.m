//
//  main.m
//  Test_NSStringPathExtensions
//
//  Created by Tianjian on 15/12/7.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        printf("\n");
        NSString *str = @"//file/123@2x.png.smb";
        NSLog(@"str1 = %@",str);
        NSLog(@"str2 = %@",[str stringByDeletingPathExtension]);
        NSLog(@"str2 = %@",[[str stringByDeletingPathExtension] pathExtension]);
        printf("\n");

        //2014-01-08T21:21:22.737+05:30
        //2014-01-08T21:21:22.737+05:30
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZZZZ"];
        
        NSDate *date = [dateFormatter dateFromString:@"2015-12-07T15:50:00.737+05:30"];
        NSDate *now  = [NSDate new];//[dateFormatter dateFromString:@"2014-01-08T22:21:22.737+05:30"];
        NSTimeInterval del = now.timeIntervalSince1970 - date.timeIntervalSince1970;
        NSLog(@"del = %lf",del);
    }
    return 0;
}
