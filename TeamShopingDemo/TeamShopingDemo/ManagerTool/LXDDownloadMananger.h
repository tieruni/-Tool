//
//  LXDDownloadMananger.h
//  TeamShopingDemo
//
//  Created by ZhiF_Zhu on 2020/3/30.
//  Copyright © 2020 ZhiF_Zhu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//block重命名
typedef void(^LXDDownloadHandler)(NSData * receiveData, NSError * error);
typedef void(^LXDDownloadProgressHandler)(CGFloat progress);

@interface LXDDownloadMananger : NSObject

- (void)downloadWithURL: (NSString *)URL parameters: (NSDictionary *)parameters handler: (LXDDownloadHandler)handler progress: (LXDDownloadProgressHandler)progress;
@end

NS_ASSUME_NONNULL_END
