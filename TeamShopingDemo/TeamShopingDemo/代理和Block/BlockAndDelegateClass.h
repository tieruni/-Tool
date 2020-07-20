//
//  BlockAndDelegateClass.h
//  TeamShopingDemo
//
//  Created by ZhiF_Zhu on 2020/5/23.
//  Copyright © 2020 ZhiF_Zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FunctionDelegate.h"
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlockAndDelegateClass : NSObject
@property(nonatomic, weak) id<FunctionDelegate> myDelegate;

@property(nonatomic, copy) clickBlock myBlock;

@property(nonatomic, strong) NSString *AAA;

-(void)BlockDoSomething;
-(void)DelegateDoSomething;

@end

NS_ASSUME_NONNULL_END
