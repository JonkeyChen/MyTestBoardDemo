#import "ViewController.h"

/**
 
    Doucoments:
 
    Library:用于存在默认的设置
        Library/Coaches:应用退出，即删除
        Library/Preferences:存储默认设置，如NSUserDefault
 
    temp:
 */


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1424822400000
    //1283376197
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:1424822400];
    NSLog(@"1296035591  = %@",confromTimesp);
    
    NSDateFormatter *formment = [[NSDateFormatter alloc]init];
    [formment setDateFormat:@"yyyy-MM-dd"];
    
    NSString *str = [formment stringFromDate:confromTimesp];
    
    NSLog(@"str = %@",str);
}

@end
