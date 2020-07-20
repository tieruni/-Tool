//
//  main.m
//  BianYiQiYouHua
//
//  Created by ZhiF_Zhu on 2020/3/23.
//  Copyright © 2020 ZhiF_Zhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

//int sum(int a , int b){
//    return a + b;
//}

int main(int argc, char * argv[]) {

//    int a = sum(1, 2);
//    NSLog(@"%d",a);
//    return 0;
    
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
//        int a = sum(1, 2);
//        NSLog(@"%d",a);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
