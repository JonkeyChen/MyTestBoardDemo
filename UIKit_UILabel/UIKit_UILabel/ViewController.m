//
//  ViewController.m
//  UIKit_UILabel
//
//  Created by Tianjian on 16/2/24.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "ViewController.h"
#import "TJLabel_Line.h"


typedef enum : NSUInteger {
    NSTextAlignmentVertailTop,
    NSTextAlignmentVertailTypeMiddle,//defalut
    NSTextAlignmentVertailTypeBottom,
} NSTextAlignmentVertailType;

@interface UILabel (Extern)

/**
 *  自动设置高度
 */
- (void)setAutoHeigh;

/**
 *  设置垂直方向对齐
 *
 *  @param textAlignment 对齐方式
 */
- (void)setTextAlginVertail:(NSTextAlignmentVertailType)textAlignment;

/**
 *  获取textContent内容所需要的尺寸
 *
 *  @return size
 */
- (CGSize)getContentSize;

@end


@implementation UILabel (Extern)
- (void)setAutoHeigh{
    NSAssert(self.frame.size.width==0||self.frame.size.height==0?nil:@"", @"请设置UILable的width或者Height");
    
    [self setNumberOfLines:0];
    CGSize size =  [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT)
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName:self.font}
                                           context:nil].size;
    self.frame =  CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, size.height);
}
- (void)setTextAlginVertail:(NSTextAlignmentVertailType)textAlignment{
    CGSize fontSize =  [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}];
    
    double finalHeight = fontSize.height*self.numberOfLines;
    double finalWidth  = self.frame.size.width;
    
    CGSize stringSize = [self.text boundingRectWithSize:CGSizeMake(finalWidth, finalHeight)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName:self.font}
                                                context:nil].size;
    
    int newLinesToPad = (finalHeight - stringSize.width) /fontSize.width;
    switch (textAlignment) {
        case NSTextAlignmentVertailTop:{
            for (int i = 0; i<newLinesToPad; i++) {
                self.text = [self.text stringByAppendingString:@"\n "];
            }
        }
            break;
        case NSTextAlignmentVertailTypeMiddle:{
        } break;
        case NSTextAlignmentVertailTypeBottom:{
            for(int i=0; i<newLinesToPad; i++){
                self.text = [NSString stringWithFormat:@" \n%@",self.text];
            }
        }
            break;
        default:
            break;
    }

}
- (CGSize)getContentSize{
    return [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT)
                                   options:NSStringDrawingUsesLineFragmentOrigin
                                attributes:@{NSFontAttributeName:self.font}
                                   context:nil].size;
}

@end

@interface NSString (Extern)

/**
 *  计算文本内容的高度(输入宽度，获取高度)
 *
 *  @param width   最大宽度
 *  @param font    字体大小
 *  @param content 文本内容
 *
 *  @return height
 */
+ (CGFloat)heigtTextContentMaxWidth:(CGFloat)maxWidth  font:(UIFont*)font withContent:(NSString*)content;
/**
 *  计算文本内容的宽度(输入高度，获取宽度)
 *
 *  @param width   最大高度
 *  @param font    字体大小
 *  @param content 文本内容
 *
 *  @return width
 */
+ (CGFloat)widthTextContentMaxHeight:(CGFloat)maxHeight font:(UIFont*)font withContent:(NSString*)content;

/**
 *  计算文本内容的尺寸(输入宽度，获取尺寸)
 *
 *  @param width   最大宽度
 *  @param font    字体大小
 *  @param content 文本内容
 *
 *  @return size
 */
+ (CGSize)sizeTextContentMaxWidth:(CGFloat)maxWidth font:(UIFont*)font withContent:(NSString*)content;
/**
 *  计算文本内容的尺寸(输入高度，获取尺寸)
 *
 *  @param height  最大高度
 *  @param font    字体大小
 *  @param content 文本内容
 *
 *  @return size
 */
+ (CGSize)sizeTextContentMaxHeight:(CGFloat)maxheight font:(UIFont*)font withContent:(NSString*)content;

@end

@implementation NSString (Extern)

+ (CGFloat)heigtTextContentMaxWidth:(CGFloat)maxWidth  font:(UIFont*)font withContent:(NSString*)content{
    return [self sizeTextContentMaxWidth:maxWidth font:font withContent:content].height;
}
+ (CGFloat)widthTextContentMaxHeight:(CGFloat)maxHeight font:(UIFont*)font withContent:(NSString*)content{
    return [self sizeTextContentMaxHeight:maxHeight font:font withContent:content].width;
}

+ (CGSize)sizeTextContentMaxWidth:(CGFloat)maxWidth font:(UIFont*)font withContent:(NSString*)content{
    return [content boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT)
                                 options:NSStringDrawingUsesLineFragmentOrigin
                              attributes:@{NSFontAttributeName:font}
                                 context:nil].size;
}
+ (CGSize)sizeTextContentMaxHeight:(CGFloat)maxheight font:(UIFont*)font withContent:(NSString*)content{
    return [content boundingRectWithSize:CGSizeMake(MAXFLOAT,maxheight)
                                 options:NSStringDrawingUsesLineFragmentOrigin
                              attributes:@{NSFontAttributeName:font}
                                 context:nil].size;
}

@end


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *content = @"内容太多，需要自适应才能解决问题，所以需要写这个扩展类,内容太多，需要自适应才能解决问题，所以需要写这个扩展类";
    UIFont *font = [UIFont systemFontOfSize:15];
    CGFloat maxHeigth = 200;
    CGFloat maxWidht  = 200;
    
    CGSize size1  = [NSString sizeTextContentMaxHeight:maxHeigth  font:font withContent:content];
    CGSize size2  = [NSString sizeTextContentMaxWidth:maxWidht    font:font withContent:content];
    CGFloat width = [NSString widthTextContentMaxHeight:maxHeigth font:font withContent:content];
    CGFloat height= [NSString heigtTextContentMaxWidth:maxWidht   font:font withContent:content];
    
    NSLog(@"计算文本内容的尺寸(输入高度，获取尺寸) = %@",NSStringFromCGSize(size1));
    NSLog(@"%@",@(width));
    NSLog(@"%@",NSStringFromCGSize(size2));
    NSLog(@"%@",@(height));
    
    UILabel *etlbl1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, size1.width, size1.height)];
    etlbl1.backgroundColor = [UIColor greenColor];
    etlbl1.text = @"内容太多，需要自适应才能解决问题，所以需要写这个扩展类";
    etlbl1.font = font;
    
    [etlbl1 setAutoHeigh];
    [self.view addSubview:etlbl1];

    UILabel *etlbl2 = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, size2.width, size2.height)];
    etlbl2.backgroundColor = [UIColor greenColor];
    etlbl2.text = @"内容太多，需要自适应才能解决问题，所以需要写这个扩展类";
    [etlbl2 setAutoHeigh];
    [self.view addSubview:etlbl2];
/************************************************基本用法************************************************************/
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:content];
    //字体大小
    [string addAttribute:NSFontAttributeName
                   value:[UIFont systemFontOfSize:10]
                   range:NSMakeRange(0, 1)];
    //字体颜色
    [string addAttribute:NSForegroundColorAttributeName
                   value:[UIColor yellowColor]
                   range:NSMakeRange(1, 1)];
    //字体背景颜色
    [string addAttribute:NSBackgroundColorAttributeName
                   value:[UIColor purpleColor]
                   range:NSMakeRange(2, 1)];

    //添加下划线
    [string addAttribute:NSUnderlineStyleAttributeName
                   value:@(NSUnderlineStyleSingle)
                   range:NSMakeRange(3, 1)];
    //添加下划线颜色
    [string addAttribute:NSUnderlineColorAttributeName
                   value:[UIColor redColor]
                   range:NSMakeRange(3, 1)];
    
    
    UILabel *etlbl3 = [[UILabel alloc]initWithFrame:CGRectMake(100, 400, 200, 30)];
    etlbl3.attributedText = string;
    [self.view addSubview:etlbl3];
    
    TJLabel_Line *etlbl = [[TJLabel_Line alloc]initWithFrame:CGRectMake(0, 450, 200, 10)];
    etlbl.lineType = LineTypeMiddle;
    etlbl.lineColor= [UIColor redColor];
    etlbl.text     = @"内容";
    [self.view addSubview:etlbl];
/************************************************基本用法************************************************************/
    
//***********keys***********************************Value****************************************//
    NSFontAttributeName;                  //字体，value是UIFont对象
    NSParagraphStyleAttributeName;        //绘图的风格（居中，换行模式，间距等诸多风格），value是NSParagraphStyle对象
    NSForegroundColorAttributeName;       // 文字颜色，value是UIFont对象
    NSBackgroundColorAttributeName;       // 背景色，value是UIFont
    NSLigatureAttributeName;              //  字符连体，value是NSNumber
    NSKernAttributeName;                  // 字符间隔
    NSStrikethroughStyleAttributeName;    //删除线，value是NSNumber
    NSUnderlineStyleAttributeName;        //下划线，value是NSNumber
    NSStrokeColorAttributeName;           //描绘边颜色，value是UIColor
    NSStrokeWidthAttributeName;           //描边宽度，value是NSNumber
    NSShadowAttributeName;                //阴影，value是NSShadow对象
    NSTextEffectAttributeName;            //文字效果，value是NSString
    NSAttachmentAttributeName;            //附属，value是NSTextAttachment 对象
    NSLinkAttributeName;                  //链接，value是NSURL or NSString
    NSBaselineOffsetAttributeName;        //基础偏移量，value是NSNumber对象
    NSUnderlineColorAttributeName;        //下划线颜色，value是UIColor对象
    NSStrikethroughColorAttributeName;    //删除线颜色，value是UIColor
    NSObliquenessAttributeName;           //字体倾斜
    NSExpansionAttributeName;             //字体扁平化
    NSVerticalGlyphFormAttributeName;     //垂直或者水平，value是 NSNumber，0表示水平，1垂直
/********************************************************************************************************************/
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
