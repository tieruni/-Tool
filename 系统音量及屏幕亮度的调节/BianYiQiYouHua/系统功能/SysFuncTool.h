//
//  SysFuncTool.h
//  BianYiQiYouHua
//
//  Created by ZhiF_Zhu on 2020/4/2.
//  Copyright © 2020 ZhiF_Zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SysFuncTool : NSObject

//获得当前屏幕亮度
+ (CGFloat) getSystemScrenBrightness;

+ (CGFloat) getSystemAudioSession;

@end

NS_ASSUME_NONNULL_END
