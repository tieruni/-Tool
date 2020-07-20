//
//  ViewController.m
//  TeamShopingDemo
//
//  Created by ZhiF_Zhu on 2020/3/29.
//  Copyright © 2020 ZhiF_Zhu. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "MBProgressHUD+CSH.h"
#import "UIImageView+WebCache.h"
#import "LXDDownloadMananger.h"

#import "BlockAndDelegateClass.h"

@interface ViewController ()<FunctionDelegate>
@property(strong,nonatomic) NSString *pictureString;

@property(nonatomic, strong) BlockAndDelegateClass *componentCls;

@end

@implementation ViewController

//+ (void)load{
//    static dispatch_once_t onceToken;
//    //////insert//
//    dispatch_once(&onceToken, ^{
//        Class cls = NSClassFromString(@"BlockAndDelegateClass");
//
//        SEL SelA = @selector(BlockDoSomething);
//        SEL SelB = @selector(DelegateDoSomething);
//        SEL SelC = @selector(Log);
//
//        Method methodA = class_getClassMethod([cls new], SelA);
//        Method methodB = class_getClassMethod([cls new], SelB);
//        Method methodC = class_getClassMethod([cls new], SelC);
//
//        method_exchangeImplementations(methodB, methodC);
//    });
//}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.pictureString = @"http://127.0.0.1/test/awy4hwfghfsdhjersygawet.jpeg";
    
    [self picture];
    
    self.componentCls = [[BlockAndDelegateClass alloc] init];
    
    self.componentCls.myDelegate = self;

    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    //GET
//    [manager GET:@"http://www.baidu.com" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        [MBProgressHUD showOnlyText:@"请求发送成功"];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        [MBProgressHUD showOnlyText:@"请求发送失败"];
//
//    }];
//    //POST
//    [manager POST:@"http://www.baidu.com" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        [MBProgressHUD showOnlyText:@"请求发送成功"];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        [MBProgressHUD showOnlyText:@"请求发送失败"];
//    }];
//
    
}


//从网络上，远程下载图片
- (void)picture{
    UIImageView *iv = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //1.网络下载数据 吧数据转为图片 再加载
    [iv sd_setImageWithURL:[NSURL URLWithString:self.pictureString]];
    [iv setContentMode:UIViewContentModeScaleToFill];
    
    [self.view addSubview:iv];

}

//封装的Block网络请求
- (void)DownloadData{

    
//    [[LXDDownloadMananger alloc] downloadWithURL: QQMUSICURL parameters: nil handler: ^(NSData * receiveData, NSError * error) {
//        if (error) {
//            NSLog(@"下载失败：%@", error)
//        }
//        else {
//            //处理下载数据
//        }
//    } progres:^(CGFloat progress) {
//        NSLog(@"下载进度%f", progress*100);
//    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self callMethod];
}

- (void)callMethod{
    
    UIViewController *NewVC = [[UIViewController alloc] init];
    NewVC.view.backgroundColor = [UIColor cyanColor];
    UIButton *backBtn = [[UIButton alloc] initWithFrame:[UIScreen mainScreen].bounds];
    backBtn.center = NewVC.view.center;
    [backBtn setTitle:@"点击返回" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(clickBack) forControlEvents:UIControlEventTouchUpInside];
    [NewVC.view addSubview:backBtn];
    
    [self presentViewController:NewVC animated:YES completion:^{
        [self.componentCls DelegateDoSomething];

    }];
}

- (void)clickBack{
    [self dismissViewControllerAnimated:YES completion:^{
        self.componentCls.myBlock = ^{
            [MBProgressHUD showOnlyText:@"我是block--小鹿萌主(^-^),我替别人做事情"];
        };
        [self.componentCls BlockDoSomething];
    }];
}

#pragma mark -- delegate
- (void)clickBackAction{
    
    [MBProgressHUD showOnlyText:@"我是delegate--小茹萌主(^-^),我替别人做事情"];

}

@end
