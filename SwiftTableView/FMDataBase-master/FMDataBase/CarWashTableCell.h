//
//  CarWashTableCell.h
//  路客app
//
//  Created by zjf on 15/4/14.
//  Copyright (c) 2015年 zjf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarWashTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *scoreImgView;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet UIImageView *headImgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *farLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

@property (weak, nonatomic) IBOutlet UIImageView *backImgView;
@property (weak, nonatomic) IBOutlet UIView *backView;

@end
