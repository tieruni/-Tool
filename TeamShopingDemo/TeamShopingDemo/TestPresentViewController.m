//
//  TestPresentViewController.m
//  TeamShopingDemo
//
//  Created by ZhiF_Zhu on 2020/5/28.
//  Copyright © 2020 ZhiF_Zhu. All rights reserved.
//

#import "TestPresentViewController.h"

@implementation TestPresentViewController

-(instancetype)init{
    self = [super init];
    if (self) {
        _dimmingView = [[UIView alloc] init];
        _dimmingView.backgroundColor = [UIColor magentaColor];
    }
    return self;
}

#pragma mark --
- (void)presentationTransitionWillBegin {
   // Add a custom dimming view behind the presented view controller's view
   [[self containerView] addSubview:_dimmingView];
   [_dimmingView addSubview:[[self presentedViewController] view]];
 
   // Use the transition coordinator to set up the animations.
    id <UIViewControllerTransitionCoordinator> transitionCoordinator =
          [[self presentingViewController] transitionCoordinator];
 
   // Fade in the dimming view during the transition.
    [_dimmingView setAlpha:0.0];
    [transitionCoordinator animateAlongsideTransition:
       ^(id<UIViewControllerTransitionCoordinatorContext> context) {
          [_dimmingView setAlpha:1.0];
       } completion:nil];
}
 
- (void)presentationTransitionDidEnd:(BOOL)completed {
   // Remove the dimming view if the presentation was aborted.
   if (!completed) {
      [_dimmingView removeFromSuperview];
   }
}

#pragma mark--delegate-optional


@end
