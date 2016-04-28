//
//  UIView+ProgressHUD.m
//  Cocoa_NSObject
//
//  Created by Tianjian on 16/3/25.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "UIView+ProgressHUD.h"
#import "MBProgressHUD.h"

#import <objc/runtime.h>

static const void *kHttpRequstProgressHUD = @"kHttpRequstProgressHUD";

@interface UIView ()

@property(nonatomic,strong)MBProgressHUD *progressHUDFY;

@end

@implementation UIView (ProgressHUD)

- (MBProgressHUD *)progressHUDFY{
    MBProgressHUD *HUD = objc_getAssociatedObject(self, &kHttpRequstProgressHUD);
    if (HUD == nil) {
        HUD = [[MBProgressHUD alloc] initWithView:self];
        [self addSubview:HUD];
        objc_setAssociatedObject(self, &kHttpRequstProgressHUD, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return HUD;
}

-(void)showLoadingViewWithMessage:(NSString*)message{
    if (message) {
        self.progressHUDFY.label.text = message;
    } else {
        self.progressHUDFY.label.text = @"";
    }
    [self.progressHUDFY showAnimated:YES];
}

-(void)stopLoadingViewWithMessage:(NSString*)message{
    if (message.length){
        self.progressHUDFY.label.text = message;
        [self.progressHUDFY hideAnimated:YES afterDelay:5];
    } else {
        [self.progressHUDFY hideAnimated:YES];
    }
}

@end
