//
//  MBProgressHUD+CSH.m
//  东田教育
//
//  Created by Sam on 15/12/8.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "MBProgressHUD+CSH.h"
#import "AppDelegate.h"

static __weak UIView *kHuDMainView;

@implementation MBProgressHUD (CSH)

#pragma mark 显示信息

+ (void)showOnlyText:(NSString *)text toView:(UIView *)view{
    if (view == nil) {
        return;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.label.textColor = UIColorFromHex(0x95FFD7);
    hud.layer.masksToBounds = YES;
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if (appDelegate.allowRotation == YES) {
        hud.margin = 6.f;
        hud.label.font = [UIFont systemFontOfSize:7*kWidthScale];
        hud.layer.cornerRadius = 11*kWidthScale;
        hud.minSize = CGSizeMake(110*kWidthScale, 22*kWidthScale);
    }else{
        hud.margin = 12.f;
        hud.label.font = [UIFont systemFontOfSize:14*kWidthScale];
        hud.label.numberOfLines = 0;
        [hud.label sizeToFit];
        hud.layer.cornerRadius = 22*kWidthScale;
        hud.minSize = CGSizeMake(220*kWidthScale, 44*kWidthScale);
    }
    
    hud.removeFromSuperViewOnHide = YES;
    // 2秒之后再消失
    [hud hideAnimated:YES afterDelay:1.5];
}

+ (void)hideHUDForView:(UIView *)view
{
    [self hideHUDForView:view animated:YES];
}

+ (void)showOnlyText:(NSString *)text
{
    [self refreshMainView];
    
    [self showOnlyText:text toView:kHuDMainView];
}

+ (MBProgressHUD *)showMessage:(NSString *)message
{
    [self refreshMainView];
    return [self showMessage:message toView:kHuDMainView];
}

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = YES;
    hud.label.text = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    hud.dimBackground = YES;
    return hud;
}

+ (void)hideHUD
{
    [self refreshMainView];
    [self hideHUDForView:kHuDMainView];
}


+ (void) refreshMainView
{
    if (kHuDMainView != nil)
    {
        [self hideHUDForView:kHuDMainView];
        kHuDMainView = nil;
    }
    for (UIWindow *window in [UIApplication sharedApplication].windows) {
        if (!window.isKeyWindow)continue;
        kHuDMainView = window;
        break;
    }
}

@end
