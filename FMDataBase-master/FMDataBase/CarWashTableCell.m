
//
//  CarWashTableCell.m
//  路客app
//
//  Created by zjf on 15/4/14.
//  Copyright (c) 2015年 zjf. All rights reserved.
//

#import "CarWashTableCell.h"

@implementation CarWashTableCell {
    
    CGFloat _ImgW;
    
}


- (void)awakeFromNib {
//    1.获取总长度
    _ImgW = self.scoreImgView.frame.size.width;
    self.priceLabel.textColor = [UIColor redColor];
    self.farLabel.textColor = [UIColor redColor];
    self.titleLabel.textColor = [UIColor blackColor];
    self.commentLabel.textColor = [UIColor blackColor];
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    
//
//    
//    NJLog(@"began");
//}
//
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
////
////    UITouch *touch = [touches anyObject];
////    CGPoint point = [touch locationInView:self.scoreImgView];
////    NJLog(@"moved=%f%f",point.x,point.y);
////    
////    if (point.x <= _ImgW && point.x>= 0) {
////        //    根据手指进行比例
////        int score = 10.0 * point.x/_ImgW  ;
////        NSString *string = [NSString stringWithFormat:@"%d,0",score];
////        self.scoreLabel.text = string;
////        
////        UIColor *old = [UIColor colorWithRed:1.0/point.x green:1.0/point.x blue:1.0/point.x alpha:1];
////        
////        self.scoreImgView.backgroundColor = old;
////        
////        
////    } else {
////        return;
////        
////    }
//
//
//}

@end
