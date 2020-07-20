//
//  ViewController.m
//  BianYiQiYouHua
//
//  Created by ZhiF_Zhu on 2020/3/23.
//  Copyright © 2020 ZhiF_Zhu. All rights reserved.
//

#import "SyStemFunction.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

#import "SysFuncTool.h"

@interface SyStemFunction ()
@property(strong,nonatomic) MPVolumeView *volumeView;

@property(strong,nonatomic) UISlider *volumeSlider;

@property(assign,nonatomic) CGFloat volumeValue;
//调节音量
@property (nonatomic, strong) UISlider *myVolumeSlider;

//纵向UISlider
@property(nonatomic, strong) UISlider *VercalSlider;

@end

@implementation SyStemFunction

 

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cyanColor];

    self.imageview =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"phone.jpg" ]];

    self.imageview.frame=self.view.bounds;

    self.imageview.autoresizingMask=UIViewAutoresizingFlexibleWidth;

    [self.view insertSubview:self.imageview atIndex:0];

    
    //创建一个滑块

    //亮度调节控件
    self.mysld = [[UISlider alloc]initWithFrame:CGRectMake(100, 500, 250, 50)];
    [self.mysld setValue:0.5];
    [self.view addSubview:self.mysld];
    //音量调节控件
    _myVolumeSlider = [[UISlider alloc] initWithFrame:CGRectMake(100, 550, 250, 50)];
    [self.myVolumeSlider setValue:0.3];
    [self.view addSubview:_myVolumeSlider];
    
    /*
    //纵向滑条
    _VercalSlider = [[UISlider alloc] initWithFrame:CGRectMake(20, 300, 250, 50)];
    _VercalSlider.transform = CGAffineTransformMakeRotation(-1.57079633);
    [self.view addSubview:_VercalSlider];
    */
    //创建一个开关

    self.myswitch=[[UISwitch alloc]initWithFrame:CGRectMake(150, 100, 150, 150)];

    [self.view addSubview:self.myswitch];

    [self.myswitch addTarget:self action:@selector(changevalue) forControlEvents:UIControlEventValueChanged];

    [self.mysld addTarget:self action:@selector(textvalue) forControlEvents:UIControlEventValueChanged];

    [self.myVolumeSlider addTarget:self action:@selector(controlVolume:) forControlEvents:UIControlEventValueChanged];
    
    
    //添加f观察者
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(systemVolumeDidChangeNoti:) name:@"AVSystemController_SystemVolumeDidChangeNotification" object:nil];

    
}

-(void)changevalue{

    if (self.myswitch.isOn) {

        //设置屏幕默认亮度为0.5
        [self.mysld setValue:0.5];

//       self.imageview.alpha=self.mysld.value;
        
    } else{


        [self.mysld setValue:0.5];


    }

}

-(void)textvalue{

    if (self.myswitch.isOn) {

//        self.imageview.alpha=self.mysld.value;
        
        //---设置屏幕亮度
        [[UIScreen mainScreen] setBrightness:self.mysld.value];
        CGFloat value = [SysFuncTool getSystemScrenBrightness];
        NSLog(@"屏幕亮度:%f",value);

    }

}

//获取MPVolumeView
-(MPVolumeView *)volumeView{
    _volumeView = [[MPVolumeView alloc]init];

    _volumeView.showsRouteButton = NO;
    //默认YES，这里为了突出，故意设置一遍
    _volumeView.showsVolumeSlider = YES;

    [_volumeView sizeToFit];
    [_volumeView setFrame:CGRectMake(-1000, -1000, 10, 10)];

    [self.view addSubview:_volumeView];
    [_volumeView userActivity];
    return _volumeView;
}

//获取MPVolumeView上面的滑条
- (UISlider *)volumeSlider{
    
    for (UIView *view in [self.volumeView subviews]){
          if ([[view.class description] isEqualToString:@"MPVolumeSlider"]){
              _volumeSlider = (UISlider*)view;//系统的音量条使其超出界面外，使用自定义的滑动条来实现调节音量的效果
              break;
          }
      }
    
    return _volumeSlider;
}

//设置音量大小
- (void)controlVolume:(UISlider *)myslider {

//    self.volumeSlider = [self volumeSlider];
//    // 需要设置 showsVolumeSlider 为 YES
//    self.volumeView.showsVolumeSlider = YES;
//    [self.volumeSlider setValue:myslider.value animated:NO];
////    [self.volumeSlider sendActionsForControlEvents:UIControlEventTouchUpInside];
//    [self.volumeSlider sizeToFit];
////    [self.volumeView sizeToFit];
    
    
    [MPMusicPlayerController applicationMusicPlayer].volume = myslider.value;


}

#pragma mark -- KVO监听系统音量的变化
//获取系统音量
-(void)systemVolumeDidChangeNoti:(NSNotification* )noti{

    //目前手机音量
    CGFloat voiceSize = [[noti.userInfo valueForKey:@"AVSystemController_AudioVolumeNotificationParameter"] floatValue];
    NSLog(@"系统音量:%f",voiceSize);
    //使自定义的滑动条相应发生变化
    self.myVolumeSlider.value = voiceSize;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


-(void)setVolume{
    
    _volumeView = [[MPVolumeView alloc]init];

    _volumeView.showsRouteButton = NO;
    //默认YES，这里为了突出，故意设置一遍
    _volumeView.showsVolumeSlider = YES;

    [_volumeView sizeToFit];
    [_volumeView setFrame:CGRectMake(-1000, -1000, 10, 10)];

    [self.view addSubview:_volumeView];
    [_volumeView userActivity];


    for (UIView *view in [_volumeView subviews]){
        if ([[view.class description] isEqualToString:@"MPVolumeSlider"]){
            _volumeSlider = (UISlider*)view;//系统的音量条使其超出界面外，使用自定义的滑动条来实现调节音量的效果
            break;
        }
    }
    //设置默认打开视频时声音为0.3，如果不设置的话，获取的当前声音始终是0
    [_volumeSlider setValue:_myVolumeSlider.value];
    
    //获取最是刚打开时的音量值
//    _volumeValue = _volumeSlider.value;
//
//    NSLog(@"系统音量:%f",_volumeValue);
    
    //设置展示音量条的值
    
//    _myVolumeSlider.value = _volumeValue;
    

    
}
//方法二

- (void)setvolume{
    //    iOS7.0之后苹果不反对使用
    //    MPMusicPlayerController *mpVC = [MPMusicPlayerController applicationMusicPlayer];
    //    //获得系统当前音量
    //    voice = _mpVC.volume;
    //
    //    voice = 0.5f;
    //    //改变系统音量
    //    mpVC.volume = voice;
}

@end
