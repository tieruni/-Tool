//
//  FunctionDelegate.h
//  TeamShopingDemo
//
//  Created by ZhiF_Zhu on 2020/5/23.
//  Copyright © 2020 ZhiF_Zhu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^clickBlock)(void);

@protocol FunctionDelegate <NSObject>
-(void)clickBackAction;
@end

NS_ASSUME_NONNULL_END
