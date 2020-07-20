//
//  SysFuncTool.m
//  BianYiQiYouHua
//
//  Created by ZhiF_Zhu on 2020/4/2.
//  Copyright © 2020 ZhiF_Zhu. All rights reserved.
//

#import "SysFuncTool.h"

@implementation SysFuncTool

+ (CGFloat) getSystemScrenBrightness{
    
    return  [UIScreen mainScreen].brightness;
}

+ (CGFloat) getSystemAudioSession{
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    CGFloat systemVolume = [audioSession outputVolume];
    return systemVolume;
}

@end
