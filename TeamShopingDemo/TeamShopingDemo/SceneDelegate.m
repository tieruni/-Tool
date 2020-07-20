#import "SceneDelegate.h"
#import "TestViewController.h"
#import "ICFViewController.h"

#import "BlockAndDelegateClass.h"

#import <objc/runtime.h>

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    SEL Sel = NSSelectorFromString(@"Log:weajugow:");
//    [[cls new] performSelector:Sel];
    [[BlockAndDelegateClass new] performSelector:Sel withObject:@"a" withObject:@"100"];
    
//    ICFViewController *vc = [[ICFViewController alloc] init];
//
//    vc.view.backgroundColor = [UIColor orangeColor];
//
//    self.window.rootViewController = vc;
//
//    [self.window makeKeyAndVisible];
    
    NSLog(@"%s",__func__);
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    NSLog(@"%s",__func__);

}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    NSLog(@"%s",__func__);

}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
    NSLog(@"%s",__func__);

}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
    NSLog(@"%s",__func__);

}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
    NSLog(@"%s",__func__);

}


@end
