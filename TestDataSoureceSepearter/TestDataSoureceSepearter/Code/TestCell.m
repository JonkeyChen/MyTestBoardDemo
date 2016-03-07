//
//  TestCell.m
//  TestDataSoureceSepearter
//
//  Created by Tianjian on 16/1/22.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "TestCell.h"
#import "TestModel.h"

@interface TestCell ()

@property (weak, nonatomic) IBOutlet UIImageView *evimgHeader;
@property (weak, nonatomic) IBOutlet UILabel *evlblName;

@end

@implementation TestCell

- (void)initConfigureCellWithEntity:(id)entity{
    if (entity) {
        TestModel *model = entity;
        self.evimgHeader.image = [UIImage imageNamed:model.imageName];
        self.evlblName.text    = model.name;
        NSLog(@"%@,%@",model.name,model.imageName);
    }
}

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
