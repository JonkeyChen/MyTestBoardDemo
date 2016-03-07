//
//  ViewController.m
//  UIKit_UITextField
//
//  Created by Tianjian on 16/3/4.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "ViewController.h"
#import "UITextField+Blocks.h"

@interface ViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) UITextField *evtxf;

@property (nonatomic,strong) UITextField *evtxfUseName;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _evtxf = ({
        UITextField *ettxf = [[UITextField alloc]init];
        ettxf.frame = CGRectMake(40, 80, 200, 30);
        //当输入框没有内容时，水印提示提示内容为password
        ettxf.placeholder = @"输入提示文字";
        //设置输入框的背景颜色，此时设置为白色如果使用了自定义的背景图片边框会被忽略掉
        ettxf.backgroundColor = [UIColor whiteColor];
        //设置字体颜色
        ettxf.textColor = [UIColor redColor];
        //设置背景
        ettxf.background = [UIImage imageNamed:@"iconfont-Mask.png"];
        //设置输入框内容的字体样式和大小
        ettxf.font = [UIFont systemFontOfSize:15];
        //每输入一个字符就变成点用语密码输入
        ettxf.secureTextEntry = YES;
        //再次编辑就清空
        ettxf.clearsOnBeginEditing = YES;//再次编辑就清空
        //设置为YES时文本会自动缩小以适应文本窗口大小.默认是保持原来大小,而让长文本滚动
        ettxf.adjustsFontSizeToFitWidth = YES;
        //设置自动缩小显示的最小字体大小
        ettxf.minimumFontSize = 20;
        

        
        //内容对齐方式
        ettxf.textAlignment = UITextAlignmentLeft;
/**********************************UITextAlignment*************************************/
            UITextAlignmentLeft   ;     //输入文字从左往右
            UITextAlignmentCenter ;     //输入文字从中间向两边
            UITextAlignmentRight  ;     //输入文字从右往左
/**************************************************************************************/

        //内容的垂直对齐方式 UITextField继承自UIControl,此类中有一个属性contentVerticalAlignment
        ettxf.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
/**************************************************************************************/
        UIControlContentVerticalAlignmentCenter  ;//中心对齐
        UIControlContentVerticalAlignmentTop     ;//向顶部靠齐
        UIControlContentVerticalAlignmentBottom  ;//向底部靠齐
        UIControlContentVerticalAlignmentFill    ;//
/**************************************************************************************/
        
        ettxf.borderStyle = UITextBorderStyleRoundedRect;//设置边框样式，只有设置了才会显示边框样式
/**************************************************************************************/
        UITextBorderStyleNone       ;
        UITextBorderStyleLine       ;
        UITextBorderStyleBezel      ;
        UITextBorderStyleRoundedRect;
/**************************************************************************************/
        
        //输入框中是否有个叉号，在什么时候显示，用于一次性删除输入框中的内容
        ettxf.clearButtonMode = UITextFieldViewModeAlways;
/******************************UITextFieldViewMode*************************************/
        UITextFieldViewModeNever            ;   //重不出现
        UITextFieldViewModeWhileEditing     ;   //编辑时出现
        UITextFieldViewModeUnlessEditing    ;   //除了编辑外都出现
        UITextFieldViewModeAlways           ;   // 一直出现
/**************************************************************************************/
        
        //设置键盘的样式
        ettxf.keyboardType = UIKeyboardTypeDefault;
/************************************UIKeyboardType************************************/
        UIKeyboardTypeDefault           ;   // 默认键盘，支持所有字符
        UIKeyboardTypeASCIICapable      ;   //支持ASCII的默认键盘
        UIKeyboardTypeNumbersAndPunctuation;//标准电话键盘，支持＋＊＃字符
        UIKeyboardTypeURL               ;   //URL键盘，支持.com按钮只支持URL字符
        UIKeyboardTypeNumberPad         ;   //数字键盘
        UIKeyboardTypePhonePad          ;   //电话键盘
        UIKeyboardTypeNamePhonePad      ;   //电话键盘，也支持输入人名
        UIKeyboardTypeEmailAddress      ;   //用于输入电子邮件地址的键盘
        UIKeyboardTypeDecimalPad        ;   //数字键盘有数字和小数点
        UIKeyboardTypeTwitter           ;   //优化的键盘，方便输入@、#字符
        UIKeyboardTypeAlphabet          ;   //
/**************************************************************************************/
        
        ettxf.autocorrectionType = UITextAutocorrectionTypeNo;//是否纠错
/***************************UITextAutocorrectionType***********************************/
        UITextAutocorrectionTypeDefault ;   //默认
        UITextAutocorrectionTypeNo      ;   //不自动纠错
        UITextAutocorrectionTypeYes     ;   //自动纠错
/**************************************************************************************/
        
        //首字母是否大写
        ettxf.autocapitalizationType = UITextAutocapitalizationTypeNone;
/***************************UITextAutocapitalizationType******************************/
        UITextAutocapitalizationTypeNone         ;//不自动大写
        UITextAutocapitalizationTypeWords        ;//单词首字母大写
        UITextAutocapitalizationTypeSentences    ;//句子的首字母大写
        UITextAutocapitalizationTypeAllCharacters;//所有字母都大写
/**************************************************************************************/
        
        //return键变成什么键
        ettxf.returnKeyType =UIReturnKeyDone;
/****************************UIReturnKeyType******************************************/
        UIReturnKeyDefault      ;//默认灰色按钮，标有Return
        UIReturnKeyGo           ;//标有Go的蓝色按钮
        UIReturnKeyGoogle       ;//标有Google的蓝色按钮，用语搜索
        UIReturnKeyJoin         ;//标有Join的蓝色按钮
        UIReturnKeyNext         ;//标有Next的蓝色按钮
        UIReturnKeyRoute        ;//标有Route的蓝色按钮
        UIReturnKeySearch       ;//标有Search的蓝色按钮
        UIReturnKeySend         ;//标有Send的蓝色按钮
        UIReturnKeyYahoo        ;//标有Yahoo的蓝色按钮
        UIReturnKeyYahoo        ;//标有Yahoo的蓝色按钮
        UIReturnKeyEmergencyCall;//紧急呼叫按钮
/**************************************************************************************/

        //最右或者最左侧(光标前的占位符)
        UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 2)];
        v.backgroundColor = [UIColor redColor];
        ettxf.leftView= v;
        ettxf.leftViewMode = UITextFieldViewModeWhileEditing;
/**************************************************************************************/
        UITextFieldViewModeNever        ;//从不出现
        UITextFieldViewModeWhileEditing ;//当编辑时出现
        UITextFieldViewModeUnlessEditing;//
        UITextFieldViewModeAlways       ;//一直存在
/**************************************************************************************/

        //键盘外观
        ettxf.keyboardAppearance=UIKeyboardAppearanceDefault;
/****************************UIReturnKeyType*******************************************/
        UIKeyboardAppearanceDefault ;//默认外观，浅灰色
        UIKeyboardAppearanceAlert   ;//深灰石墨色
/**************************************************************************************/
        
        ettxf.delegate = self;
        
/**************************************************************************************/
/**************************************************************************************/
/**************************************************************************************/
/**************************************************************************************/
/**************************************************************************************/
/**************************************************************************************/
        [self.view addSubview:ettxf];
        ettxf;
    });
    
    
    
    
    
    
    _evtxfUseName = ({
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:@"水印提示文字"];
        [str addAttribute:NSForegroundColorAttributeName
                    value:[UIColor redColor]
                    range:NSMakeRange(0, 2)];
        
        UITextField *ettxf = [[UITextField alloc]init];
        ettxf.frame = CGRectMake(100, 200, 100, 30);
        //ettxf.placeholder = @"xxxx";
        ettxf.attributedPlaceholder =  str;
        ettxf.borderStyle = UITextBorderStyleRoundedRect;
        ettxf.clearButtonMode = UITextFieldViewModeWhileEditing;
        ettxf.delegate = self;
        ettxf.clearsOnBeginEditing = YES;
        ettxf.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
        ettxf.shouldBegindEditingBlock = ^BOOL(UITextField *textField){
            [ettxf becomeFirstResponder];
            return YES;
        };
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center addObserver:self
                   selector:@selector(texfFieldNotification:)
                       name:UITextFieldTextDidChangeNotification object:nil];
        
        
        [ettxf addTarget:self
                  action:@selector(textFieldDidChange:)
        forControlEvents:UIControlEventEditingChanged];
/****************************UIControlEvents********************************/
        UIControlEventEditingDidBegin      ;//
        UIControlEventEditingChanged       ;//
        UIControlEventEditingDidEnd        ;//
        UIControlEventEditingDidEndOnExit  ;//
/***************************************************************************/
        
        ettxf.shouldEndEditingBlock = ^BOOL(UITextField *textField){
            return YES;
        };
        
        ettxf.shouldChangeCharactersInRangeBlock = ^BOOL(UITextField *textField, NSRange range, NSString *string){
            NSString *str = [textField.text stringByReplacingCharactersInRange:range withString:string];
            NSLog(@"%@ || %@",string,str);
            return YES;
        };
        
        [ettxf setShouldBegindEditingBlock:^BOOL(UITextField *textField) {
            return YES;
        }];
        [ettxf setShouldChangeCharactersInRangeBlock:^BOOL(UITextField *textField, NSRange range, NSString *string) {
            NSString *str = [textField.text stringByReplacingCharactersInRange:range withString:string];
            NSLog(@"%@ || %@",string,str);
            return YES;
        }];
        [ettxf setShouldEndEditingBlock:^BOOL(UITextField *textField) {
            return YES;
        }];
        
        [self.view addSubview:ettxf];
        ettxf;
    });
    [self efObserverKeyBoardShowAndHidde];
}
- (void)efObserverKeyBoardShowAndHidde{
    //注册键盘出现
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyBoardWasShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyBoardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}
- (void)keyBoardWasShow:(NSNotification*)aNotification{
    NSLog(@"键盘出现");
    //键盘高度
    CGRect keyBoardFrame = [[[aNotification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSLog(@"%.0f,%.0f,%.0f,%.0f",keyBoardFrame.origin.x,keyBoardFrame.origin.y,keyBoardFrame.size.width,keyBoardFrame.size.height);
}
-(void)keyBoardWillBeHidden:(NSNotification*)aNotification{
    NSLog(@"键盘消失");
}

- (void)removeObserver{//移除所有通知
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


- (void)textFieldDidChange:(UITextField*)textField{
    NSLog(@"输入框内容 = %@",textField.text);
}
- (void)texfFieldNotification:(NSNotification*)noti{
    NSLog(@"输入款变化了");
}

//返回一个BOOL值，指定是否循序文本字段开始编辑
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}
//开始编辑时触发，文本字段将成为firstresponder
- (void)textFieldDidBeginEditing:(UITextField *)textField{
}
//返回BOOL值，指定是否允许文本字段结束编辑，当编辑结束，文本字段会让出firstresponder
//要想在用户结束编辑时阻止文本字段消失，可以返回NO
//这对一些文本字段必须始终保持活跃状态的程序很有用，比如即时消息
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}
//结束编辑
- (void)textFieldDidEndEditing:(UITextField *)textField{

}
//当用户使用自动更正功能，把输入的文字修改为推荐的文字时，就会调用这个方法。
//这对于想要加入撤销选项的应用程序特别有用
//可以跟踪字段内所做的最后一次修改，也可以对所有编辑做日志记录,用作审计用途。
//要防止文字被改变可以返回NO
//这个方法的参数中有一个NSRange对象，指明了被改变文字的位置，建议修改的文本也在其中


//#define NUMBERS @”0123456789\n” （这个代表可以输入数字和换行，请注意这个\n，如果不写这个，Done按键将不会触发，如果用在SearchBar中，将会不触发Search事件，因为你自己限制不让输入\n，好惨，我在项目中才发现的。）

//所以，如果你要限制输入英文和数字的话，就可以把这个定义为：

//#define kAlphaNum   @”ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789″。

//当然，你还可以在以上方法return之前，做一提示的，比如提示用户只能输入数字之类的。如果你觉得有需要的话。

#define kNUMBERS @”0123456789\n”


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"\n"]) {
        NSLog(@"回车");
    }
    if ([string isEqualToString:@""]) {
        NSLog(@"后退");
    }
    if ([string isEqualToString:@" "]) {
        NSLog(@"空格");
        //return NO;//禁止空格输入
    }
    NSString * textString = [textField.text stringByReplacingCharactersInRange:range withString:string];//UITextField内容
    if (textString.length>4) {
        NSLog(@"输入超过5位数");
    }
    //打印当前键盘输入模式,en-US,zh-Hans....
    NSString *lang = [[UITextInputMode currentInputMode]primaryLanguage];
    
    //ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789
    //限制输入已知的字符
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789\n"]invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs]componentsJoinedByString:@""]; //按cs分离出数组,数组按@""分离出字符串
    BOOL canChange = [string isEqualToString:filtered];
    
    
    return YES;
}
//返回一个BOOL值指明是否允许根据用户请求清除内容
//可以设置在特定条件下才允许清除内容
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    return YES;
}
//返回一个BOOL值，指明是否允许在按下回车键时结束编辑
//如果允许要调用resignFirstResponder方法，这回导致结束编辑，而键盘会被收起[textFieldresignFirstResponder];
- (BOOL)textFieldShouldReturn:(UITextField *)textField{//辞去职务
    //主要是[receiver resignFirstResponder]在哪调用就能把receiver对应的键盘往下收
    [textField resignFirstResponder];
    return YES;
}


@end
