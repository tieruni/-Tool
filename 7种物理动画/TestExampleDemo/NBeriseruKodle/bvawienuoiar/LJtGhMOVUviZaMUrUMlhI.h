//
//  LJtGhMOVUviZaMUrUMlhI.h
//  WMZBanner
//
//  Created by wmz on 2019/9/6.
//  Copyright © 2019 wmz. All rights reserved.
//

#import "WMZBannerConfig.h"
NS_ASSUME_NONNULL_BEGIN

@interface LJtGhMOVUviZaMUrUMlhI : NSObject
/* =========================================Attributes==========================================*/

//布局方式 frame  必传
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, CGRect,               wFrame)
//数据源 必传
WMZBannerPropStatementAndPropSetFuncStatement(strong, LJtGhMOVUviZaMUrUMlhI, NSArray*,             wData)
//特殊样式 default 无
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, SpecialStyle,                 wSpecialStyle)
//开启缩放 default NO
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, BOOL,                 wScale)
//开启卡片重叠模式 default NO
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, BOOL,                 wCardOverLap)
//卡片重叠显示个数 default 4
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, NSInteger,            wCardOverLapCount)
//背景毛玻璃效果 default NO
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, BOOL,                 wEffect)
//隐藏pageControl default NO
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, BOOL,                 wHideBannerControl)
//是否允许手势滑动 default YES
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, BOOL,                 wCanFingerSliding)
//图片不变形铺满 默认 YES
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, BOOL,                 wImageFill)
//开启无线滚动 default NO
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, BOOL,                 wRepeat)
//开启自动滚动 default NO
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, BOOL,                 wAutoScroll)
//纵向(cell全屏的时候有效) default NO
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, BOOL,                 wVertical)
//跑马灯(文字效果) default NO
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, BOOL,                 wMarquee)
//点击左右居中
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, BOOL,                 wClickCenter)
//中间视图放最上面 default NO
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, BOOL,                 wZindex)
//增加快速滑动的回弹动画 default NO
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, BOOL,                 wAddFastScrollAnina)
//整体间距 默认UIEdgeInsetsMake(0,0, 0, 0)
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, UIEdgeInsets,         wSectionInset)
//整体视图缩放系数 default 1
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, CGFloat,              wScreenScale)
//毛玻璃背景的高度 (视图的高度*倍数) default 1 范围0~1
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, CGFloat,              wEffectHeight)
//缩放系数 数值越大缩放越大 default 0.5 卡片叠加效果时默认为0.8
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, CGFloat,              wScaleFactor)
//左右的透明度 default 1
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, CGFloat,              wAlpha)
//垂直缩放 数值越大缩放越小 default 400
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, CGFloat,              wActiveDistance)
//item的size default 视图的宽高 item的width最小为父视图的一半 (为了保证同屏最多显示3个 减少不必要的bug)
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, CGSize,               wItemSize)
//item的之间的间距 default 0
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, CGFloat,              wLineSpacing)
//滑动的时候偏移的距离 以倍数计算 default 0.5 正中间
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, CGFloat,              wContentOffsetX)
//左右相邻item的中心点 default BannerCellPositionCenter
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, BannerCellPosition,   wPosition)
//占位图片 默认 -
WMZBannerPropStatementAndPropSetFuncStatement(copy,   LJtGhMOVUviZaMUrUMlhI, NSString*,            wPlaceholderImage)
//数据源的图片字段 默认 icon
WMZBannerPropStatementAndPropSetFuncStatement(copy,   LJtGhMOVUviZaMUrUMlhI, NSString*,            wDataParamIconName)
//滚动减速时间 default UIScrollViewDecelerationRateFast
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, UIScrollViewDecelerationRate,wDecelerationRate)
//自动滚动间隔时间 default 3.0f
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, CGFloat,              wAutoScrollSecond)
//默认移动到第几个 default 0
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, NSInteger,            wSelectIndex)
//自定义cell内容 默认是Collectioncell类
WMZBannerPropStatementAndPropSetFuncStatement(copy,   LJtGhMOVUviZaMUrUMlhI, BannerCellCallBlock,  wMyCell)
//特殊样式SpecialLine 自定义下划线
WMZBannerPropStatementAndPropSetFuncStatement(copy,   LJtGhMOVUviZaMUrUMlhI, BannerSpecialLine,                  wSpecialCustumLine)
//自定义cell的类名 自定义视图必传 不然会crash
WMZBannerPropStatementAndPropSetFuncStatement(copy,   LJtGhMOVUviZaMUrUMlhI, NSString*,            wMyCellClassName)
//系统的圆点颜色  default  ffffff
WMZBannerPropStatementAndPropSetFuncStatement(strong, LJtGhMOVUviZaMUrUMlhI, UIColor*,             wBannerControlColor)
//系统的圆点选中颜色  default  orange
WMZBannerPropStatementAndPropSetFuncStatement(strong, LJtGhMOVUviZaMUrUMlhI, UIColor*,             wBannerControlSelectColor)
//自定义安全的圆点图标  default -
WMZBannerPropStatementAndPropSetFuncStatement(copy,   LJtGhMOVUviZaMUrUMlhI, NSString*,            wBannerControlImage)
//自定义安全的选中圆点图标  default -
WMZBannerPropStatementAndPropSetFuncStatement(copy,   LJtGhMOVUviZaMUrUMlhI, NSString*,            wBannerControlSelectImage)
//自定义安全的圆点图片圆角 default ImageSize/2
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, CGFloat,              wBannerControlImageRadius)
//自定义安全的圆点图标的size  default (5,5)
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, CGSize,               wBannerControlImageSize)
//自定义安全的选中圆点图标的size (10,5)
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, CGSize,               wBannerControlSelectImageSize)
//自定义圆点的间距 default 3
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, CGFloat,              wBannerControlSelectMargin)
//自定义pageControl
WMZBannerPropStatementAndPropSetFuncStatement(copy,   LJtGhMOVUviZaMUrUMlhI, BannerPageControl,             wCustomControl)
//pageControl的位置 default BannerControlCenter
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, BannerControlPosition,wBannerControlPosition)
//跑马灯文字颜色  default  red
WMZBannerPropStatementAndPropSetFuncStatement(strong, LJtGhMOVUviZaMUrUMlhI, UIColor*,             wMarqueeTextColor)
//跑马灯速度  default  5
WMZBannerPropStatementAndPropSetFuncStatement(assign, LJtGhMOVUviZaMUrUMlhI, CGFloat,              wMarqueeRate)

/* =========================================Attributes==========================================*/

/* =========================================Events==============================================*/
LJtGhMOVUviZaMUrUMlhI * BannerParam(void);
//点击方法
WMZBannerPropStatementAndPropSetFuncStatement(copy,   LJtGhMOVUviZaMUrUMlhI, BannerClickBlock,     wEventClick)
//点击方法 可获取居中cell
WMZBannerPropStatementAndPropSetFuncStatement(copy,   LJtGhMOVUviZaMUrUMlhI, BannerCenterClickBlock,wEventCenterClick)
//每次滚动结束都会调用 最好是关闭自动滚动的场景使用
WMZBannerPropStatementAndPropSetFuncStatement(copy,   LJtGhMOVUviZaMUrUMlhI, BannerScrollEndBlock, wEventScrollEnd)
/* =========================================Events==============================================*/

/* =========================================custom==============================================*/
@property(nonatomic,assign)NSInteger myCurrentPath;
/* =========================================custom==============================================*/

@end

NS_ASSUME_NONNULL_END
