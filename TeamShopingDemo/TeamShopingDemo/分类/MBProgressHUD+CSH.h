//
//  MBProgressHUD+CSH.h
//  东田教育
//
//  Created by Sam on 15/12/8.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (CSH)


// 显示一个只有文字的消息，1秒后自动隐藏
+ (void)showOnlyText:(NSString *)text toView:(UIView *)view;
+ (void)showOnlyText:(NSString *)text;
+ (MBProgressHUD *)showMessage:(NSString *)message;
//隐藏一个消息
+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;


@end
