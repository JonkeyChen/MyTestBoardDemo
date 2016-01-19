//
//  TestCell.m
//  ZXPAutoLayout
//
//  Created by Tianjian on 15/12/22.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "TestCell.h"
#import "UITableView+SDAutoTableViewCellHeight.h"

@implementation TestCell

- (void)load:(NSString *)string{
    self.evlblTest.text = string;
}

- (void)awakeFromNib {
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
