//
//  LXDDownloadMananger.m
//  TeamShopingDemo
//
//  Created by ZhiF_Zhu on 2020/3/30.
//  Copyright © 2020 ZhiF_Zhu. All rights reserved.
//


@interface LXDDownloadManager: NSObject< NSURLSessionDownloadDelegate>

@end

@implementation LXDDownloadManager
//{
//    LXDDownloadProgressHandler _progress;
//}
//
//- (void)downloadWithURL: (NSString *)URL parameters: (NSDictionary *)parameters handler: (LXDDownloadHandler)handler progress: (LXDDownloadProgressHandler)progress
//{
//    //创建请求对象
//    NSURLRequest * request = [self postRequestWithURL: URL params: parameters];
//    NSURLSession * session = [NSURLSession sharedSession];
//
//    //执行请求任务
//    NSURLSessionDataTask * task = [session dataTaskWithRequest: request completionHandler: ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        if (handler) {
//            dispatch_async(dispatch_get_main_queue(), ^{
//                handler(data, error);
//            });
//        }
//    }];
//    [task resume];
//}

////进度协议方法
//- (void)URLSession:(NSURLSession *)session
//     downloadTask:(NSURLSessionDownloadTask *)downloadTask
//    didWriteData:(int64_t)bytesWritten // 每次写入的data字节数
//   totalBytesWritten:(int64_t)totalBytesWritten // 当前一共写入的data字节数
//  totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite // 期望收到的所有data字节数
//{
//    double downloadProgress = totalBytesWritten / (double)totalBytesExpectedToWrite;
//    if (_progress) {
//        _progress(downloadProgress);
//    }
//}


@end
