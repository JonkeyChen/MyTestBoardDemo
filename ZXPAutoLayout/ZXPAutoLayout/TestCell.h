//
//  TestCell.h
//  ZXPAutoLayout
//
//  Created by Tianjian on 15/12/22.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *evlblTest;

- (void)load:(NSString*)string;

@end
