//
//  LJtGhLTTPxpwzom.m
//  DecodeTest
//
//  Created by Yimmm on 2019/12/27.
//  Copyright © 2019 alpha. All rights reserved.
//

#import "LJtGhLTTPxpwzom.h"
#import "LJtGhIFKZibAvXusmZLmz.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@interface LJtGhLTTPxpwzom ()<LQCarouselDelegate>

@end

@implementation LJtGhLTTPxpwzom


- (void)viewDidLoad {
    [super viewDidLoad];
    
    LJtGhIFKZibAvXusmZLmz *lunbo = [[LJtGhIFKZibAvXusmZLmz alloc]initWithFrame:CGRectMake(0, 0,ScreenWidth , 200) andArray:@[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg",@"6.jpg"] andType:LQCarouselTypeLocalImage];
    lunbo.delegate = self;
    lunbo.isAuto = YES;
    [self.view addSubview:lunbo];
    
    NSArray *imageArr = @[@"https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg",
                          @"https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-2.jpg",
                          @"https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-4.jpg",
                          @"https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-5.jpg"];
    LJtGhIFKZibAvXusmZLmz *webLunbo = [[LJtGhIFKZibAvXusmZLmz alloc]initWithFrame:CGRectMake(0, 210, ScreenWidth, 200) andArray:imageArr andType:LQCarouselTypeWebImage];
    [self.view addSubview:webLunbo];
    webLunbo.delegate = self;
    webLunbo.isAuto = YES;
    
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i = 0; i < 5; i++) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 200)];
        view.backgroundColor = [UIColor colorWithRed:0.1*i+0.1 green:0.2*i blue:0.15*i alpha:1];
        [arr addObject:view];
    }
    LJtGhIFKZibAvXusmZLmz *viewLunBo = [[LJtGhIFKZibAvXusmZLmz alloc]initWithFrame:CGRectMake(0, 420, ScreenWidth, 200) andArray:arr.copy andType:LQCarouselTypeView];
    [self.view addSubview:viewLunBo];
    viewLunBo.delegate = self;
    
    
}

#pragma mark ---LQCarouselDelegate
-(void)scrollViewAtIndex:(NSInteger)index andType:(LQCarouselType)type{
    switch (type) {
        case LQCarouselTypeLocalImage:
            NSLog(@"move to%ld locol photo",index);
            break;
        case LQCarouselTypeWebImage:
            NSLog(@"move to%ld net photo",index);
            break;
        case LQCarouselTypeView:
            NSLog(@"move to%ld view",index);
            break;
            
    }
}

-(void)clickImageViewAtIndex:(NSInteger)index andType:(LQCarouselType)type{
    switch (type) {
        case LQCarouselTypeLocalImage:
            NSLog(@"click the %ldbab",index);
            break;
        case LQCarouselTypeWebImage:
            NSLog(@"click the %ldaba",index);
            break;
        default: break;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
