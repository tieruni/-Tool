//
//  TestViewController.m
//  TeamShopingDemo
//
//  Created by ZhiF_Zhu on 2020/5/28.
//  Copyright © 2020 ZhiF_Zhu. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    //组合动画
    UIImageView *animationImg = [self getArrowAnimationWithFrame:CGRectMake((kScreenWidth-50)*0.5, (kScreenHeight-50)*0.5, 50, 50) image:@"icon_dianzan"];
    
    [self.view addSubview:animationImg];
    
    UIButton *zanBtn = [self Animation:CGRectMake((kScreenWidth-50)*0.5, 100, 50, 50) image:@"icon_tap"];
    
    [self.view addSubview:zanBtn];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundColor:[UIColor blueColor]];
    [button setTitle:@"normal" forState:UIControlStateNormal];
    [button setTitle:@"highlighted" forState:UIControlStateHighlighted];
    button.frame = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - 30 -24, [[UIScreen mainScreen] bounds].size.width, 30);
    
    [button addTarget:self action:@selector(touchDownAction) forControlEvents:UIControlEventTouchDown];
    [button addTarget:self action:@selector(touchUpInsideAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    

}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    for (UIGestureRecognizer *gesture in self.view.window.gestureRecognizers) {
        NSLog(@"gesture = %@",gesture);
        gesture.delaysTouchesBegan = NO;
        NSLog(@"delaysTouchesBegan = %@",gesture.delaysTouchesBegan?@"YES":@"NO");
        NSLog(@"delaysTouchesEnded = %@",gesture.delaysTouchesEnded?@"YES":@"NO");
    }
//    self.navigationController.interactivePopGestureRecognizer.delaysTouchesBegan = NO;//导航栏跳到下个页面，滑动返回

}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

-(UIImageView *)getArrowAnimationWithFrame:(CGRect)frame image:(NSString *)imageName{
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:frame];
    imgView.image = [UIImage imageNamed:imageName];
    [self.view addSubview:imgView];
    
    imgView.alpha = 0;
    //position改变状态
    CABasicAnimation *animation = [CABasicAnimation new];
    animation.keyPath = @"position.y";
    animation.fromValue = @(kScreenWidth-60);
    animation.toValue = @(kScreenWidth-80);
    animation.duration = 1.5;
    animation.repeatCount = 1;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *animation2 = [CABasicAnimation new];
    animation2.keyPath = @"opacity";//指定keyPath为CALayer的属性值,以达到对应的动画效果
    animation2.fromValue = @(0);
    animation2.toValue = @(1);
    animation2.duration = 1.5;//动画的持续时间
    animation2.repeatCount = 1;//动画的重复次数
    animation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];//动画的时间节奏控制
    animation2.removedOnCompletion = NO;//动画执行完毕后是否从图层上移除，默认为YES（视图会恢复到动画前的状态），可设置为NO
    animation2.fillMode = kCAFillModeForwards;//（图层保持动画执行后的状态，前提是fillMode设置为kCAFillModeForwards）
    
    //组合动画
    CAAnimationGroup *group = [CAAnimationGroup new];
    group.animations = @[animation,animation2];
    group.repeatCount = HUGE_VALF;
    group.duration = 1.5;
    group.autoreverses = YES;
    [imgView.layer addAnimation:group forKey:@"position"];
    
    return imgView;
}

- (UIButton *)Animation:(CGRect)frame image:(NSString *)imageName{
    
    UIButton *tapBtn = [[UIButton alloc] initWithFrame:frame];
    [tapBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    moveAnimation.duration = 1.2;//动画时间
    //动画起始值和终止值的设置
    moveAnimation.fromValue = @(1.3);
    moveAnimation.toValue = @(0.9);
    //动画执行中快慢的过程
    moveAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    moveAnimation.repeatCount = HUGE_VALF;
//    moveAnimation.repeatDuration = 2;
    moveAnimation.removedOnCompletion = NO;
    moveAnimation.fillMode = kCAFillModeForwards;
    //添加动画，后面有可以拿到这个动画的标识
    [tapBtn.layer addAnimation:moveAnimation forKey:@""];
    
    return tapBtn;
}

- (void)touchDownAction{
    NSLog(@"延迟触摸事件");
}

- (void)touchUpInsideAction{
    NSLog(@"触摸事件");
}

@end
