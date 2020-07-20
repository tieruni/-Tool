//
//  LJtGhIFKZibAvXusmZLmz.h
//  LunBoDemo
//
//  Created by liquan on 2017/3/24.
//  Copyright © 2017年 liquan. All rights reserved.
//

#import <UIKit/UIKit.h>

//轮播类型
typedef NS_ENUM(NSInteger,LQCarouselType) {
    LQCarouselTypeLocalImage = 0,//本地图片轮播
    LQCarouselTypeWebImage,      //网络图片轮播
    LQCarouselTypeView           //View轮播
};

@protocol LQCarouselDelegate <NSObject>


/**
 点击图片

 @param index 点击了第几张图片
 @param type 是哪种类型的轮播
 */
-(void)clickImageViewAtIndex:(NSInteger)index andType:(LQCarouselType)type;



/**
 滑动

 @param index 滑动到第几页
 @param type 是哪种类型的轮播
 */
-(void)scrollViewAtIndex:(NSInteger)index andType:(LQCarouselType)type;

@end






@interface LJtGhIFKZibAvXusmZLmz : UIView

@property(nonatomic,weak)id<LQCarouselDelegate> delegate;

//是否自动轮播
@property(nonatomic,assign)BOOL isAuto;

/**
 创建轮播

 @param frame 布局
 @param array 本地图片名字数组/网络图片地址数组/view数组
 @param type 轮播类型
 @return 创建的对象
 */
-(instancetype)initWithFrame:(CGRect)frame andArray:(NSArray *)array andType:(LQCarouselType)type;
@end
