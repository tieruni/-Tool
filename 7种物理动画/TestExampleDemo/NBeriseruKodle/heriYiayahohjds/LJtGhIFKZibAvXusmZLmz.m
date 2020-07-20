//
//  LJtGhIFKZibAvXusmZLmz.m
//  LunBoDemo
//
//  Created by liquan on 2017/3/24.
//  Copyright © 2017年 liquan. All rights reserved.
//

#import "LJtGhIFKZibAvXusmZLmz.h"
//#import "LJtGhSYClUQTJqNeNi.h"

#define ViewWidth self.frame.size.width
#define ViewHeight self.frame.size.height


//设置pageControl 的颜色
#define DefaultColor   [UIColor whiteColor]
//设置pageControl 的高亮颜色
#define DefaultHeightColor [UIColor orangeColor]

//pageControl 的宽度
static const CGFloat PageWidth = 150.0;
//pageControl 的高度
static const CGFloat PageHeight = 40.0;
//pageControll距离底部的高度
static const CGFloat MarginBottom = 20.0;
//设置轮播的间隔时间 默认是2s
static const CGFloat TimeInterval = 2.0;



@interface LJtGhIFKZibAvXusmZLmz()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *scrollView;

@property(nonatomic,strong)UIPageControl *pageControl;
//网络图片数组
@property(nonatomic,strong)NSArray<NSString *> *webImageArr;
//本地图片数组
@property(nonatomic,strong)NSArray<NSString *> *localImageArr;
//view数组
@property(nonatomic,strong)NSArray<UIView *> *viewArr;
//根据轮播类型创建3个部分实现轮播效果
@property(nonatomic,strong)NSMutableArray *componentArr;
//当前的轮播类型
@property(nonatomic,assign)LQCarouselType type;
//定时器
@property(nonatomic,strong)NSTimer *timer;

@end

@implementation LJtGhIFKZibAvXusmZLmz

-(instancetype)initWithFrame:(CGRect)frame andArray:(NSArray *)array andType:(LQCarouselType)type{
    if (self = [super initWithFrame:frame]) {
        self.type = type;
        [self addSubview:self.scrollView];
        
        //设置圆点的个数
        self.pageControl.numberOfPages = array.count;
        
        if (_type == LQCarouselTypeWebImage) {
            self.webImageArr = array;
            [self addSubview:self.pageControl];
        }else if (_type == LQCarouselTypeLocalImage){
            self.localImageArr = array;
            [self addSubview:self.pageControl];
        }else{
            self.viewArr = array;
        }
        
        [self createComponentArr];
    }
    return self;
}

-(void)createComponentArr{
    _componentArr = [NSMutableArray array];
    switch (_type) {
            //网络图片轮播
        case LQCarouselTypeWebImage:
            {
                [self createWebImageView];
             }
              break;
            //本地图片轮播
        case LQCarouselTypeLocalImage:
           {
               [self createLocalImageView];
           }
              break;
            //View轮播
        case LQCarouselTypeView:
           {
               [self createView];
           }
            break;
    }
    
}
//创建本地图片3个imageView
-(void)createLocalImageView{
    for (NSInteger i = 0; i < 3; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(ViewWidth*i, 0, ViewWidth, ViewHeight)];
        NSInteger index;
        if (i == 0) {
            index = _localImageArr.count - 1;
        }else if (i == 1){
            index =  0;
        }else{
            index = 1;
        }
        imageView.tag = index;
        [self setupLocalImageView:imageView atIndex:index];
        
        //给每张图片添加点击手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickImageView:)];
        [imageView addGestureRecognizer:tap];
        imageView.userInteractionEnabled = YES;
        
        [self.scrollView addSubview:imageView];
        [self.componentArr addObject:imageView];

    }
}
-(void)setupLocalImageView:(UIImageView *)imageView atIndex:(NSInteger)index{
    imageView.image = [UIImage imageNamed:_localImageArr[index]];
}

//创建网络图片3个imageViwe
-(void)createWebImageView{
    for (NSInteger i = 0; i < 3; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(ViewWidth*i, 0, ViewWidth, ViewHeight)];
        
        NSInteger index;
        if (i == 0) {
            index = _webImageArr.count - 1;
        }else if (i == 1){
            index =  0;
        }else{
            index = 1;
        }
        imageView.tag = index;
        [self setupWebImageView:imageView atIndex:index];
        //给每张图片添加点击手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickImageView:)];
        [imageView addGestureRecognizer:tap];
        imageView.userInteractionEnabled = YES;
        
        
        [self.scrollView addSubview:imageView];
        [self.componentArr addObject:imageView];
    }
}
-(void)setupWebImageView:(UIImageView *)imageView atIndex:(NSInteger)index{
//    [imageView sd_setImageWithURL:[NSURL URLWithString:_webImageArr[index]]];
}

//创建3个View
-(void)createView{
    for (NSInteger i = 0; i < 3; i++) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(ViewWidth*i, 0, ViewWidth, ViewHeight)];
        NSInteger index;
        if (i == 0) {
            index = _viewArr.count - 1;
        }else if (i == 1){
            index =  0;
        }else{
            index = 1;
        }
        view.tag = index;
        [self setupView:view atIndex:index];
        
        [self.scrollView addSubview:view];
        [self.componentArr addObject:view];
    }
}

-(void)setupView:(UIView *)view atIndex:(NSInteger)index{
    for (UIView *subview in view.subviews) {
        [subview removeFromSuperview];
    }
    [view addSubview:_viewArr[index]];
}
//创建scrollView
-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ViewWidth, ViewHeight)];
        _scrollView.contentSize = CGSizeMake(ViewWidth*3, 0);
        _scrollView.delegate = self;
        _scrollView.bounces = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.contentOffset = CGPointMake(ViewWidth, 0);
    }
    return _scrollView;
}

-(UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(ViewWidth/2 - PageWidth/2, ViewHeight - PageHeight - MarginBottom, PageWidth, PageHeight)];
        //设置圆点颜色
        _pageControl.pageIndicatorTintColor = DefaultColor;
        //设置当前圆点的颜色
        _pageControl.currentPageIndicatorTintColor = DefaultHeightColor;
        //设置pageControl 当前显示第0页
        _pageControl.currentPage = 0;
        //设置当只有一页时隐藏pageControl
        _pageControl.hidesForSinglePage = YES;
        //添加点击事件
        [_pageControl addTarget:self action:@selector(clickPageControl:) forControlEvents:UIControlEventValueChanged];
        //默认pageControl不能点击
        _pageControl.userInteractionEnabled = NO;
    }
    return _pageControl;
}

#pragma mark ---点击ImageView
-(void)clickImageView:(UITapGestureRecognizer*)tap{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickImageViewAtIndex:andType:)]) {
        UIImageView *imageView = (UIImageView *)tap.view;
        [self.delegate clickImageViewAtIndex:imageView.tag andType:_type];
    }
}

#pragma mark --- 点击圆点
-(void)clickPageControl:(UIPageControl *)pageControl{
    NSInteger currentPage = pageControl.currentPage;
    if (_type == LQCarouselTypeLocalImage) {
        for (NSInteger i = 0; i < 3; i++) {
            UIImageView *imageView = _componentArr[i];
            NSInteger index;
            if (i == 0) {
                if (currentPage == 0) {
                    index = _localImageArr.count - 1;
                }else{
                    index = currentPage - 1;
                }
            }else if (i == 1){
                index = currentPage;
            }else{
                if (currentPage == _localImageArr.count -1) {
                    index = 0;
                }else{
                    index = currentPage + 1;
                }
            }
            imageView.tag = index;
            [self setupLocalImageView:imageView atIndex:index];
        }
        
    }else if (_type == LQCarouselTypeWebImage){
        for (NSInteger i = 0; i < 3; i++) {
            UIImageView *imageView = _componentArr[i];
            NSInteger index;
            if (i == 0) {
                if (currentPage == 0) {
                    index = _webImageArr.count - 1;
                }else{
                    index = currentPage - 1;
                }
            }else if (i == 1){
                index = currentPage;
            }else{
                if (currentPage == _webImageArr.count -1) {
                    index = 0;
                }else{
                    index = currentPage + 1;
                }
            }
            imageView.tag = index;
            [self setupWebImageView:imageView atIndex:index];
        }
    }
    self.scrollView.contentOffset = CGPointMake(ViewWidth, 0);
}

-(void)setIsAuto:(BOOL)isAuto{
    _isAuto = isAuto;
    if (_isAuto) {
        [self createTimer];
        
    }
}

//创建定时器
-(void)createTimer{
   
    NSTimer *timer = [NSTimer   scheduledTimerWithTimeInterval:TimeInterval target:self selector:@selector(goNextView) userInfo:nil repeats:YES ];
    self.timer = timer;
    //消息循环
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    // 默认是NSDefaultRunLoopMode  但是另外一个属性NSRunLoopCommonModes 能够在多线程中起作用
    [runloop addTimer:timer forMode:NSDefaultRunLoopMode];
    //立即执行定时器的方法
   // [timer fire];
}

-(void)stopTimer{
    [self.timer invalidate];
    self.timer = nil;
}
-(void)goNextView{
    
    NSInteger currentPage = self.pageControl.currentPage;
    
    
    if (_type == LQCarouselTypeLocalImage) {
        NSInteger nextPage = (currentPage + 1)%_localImageArr.count;
        self.pageControl.currentPage = nextPage;
        for (NSInteger i = 0; i< 3 ; i++) {
            UIImageView *imageView = _componentArr[i];
            NSInteger index;
            if (i == 0) {
                if (nextPage - 1 < 0) {
                    index = _localImageArr.count -1;
                }else{
                    index = nextPage -1;
                }
            }else if (i == 1){
                index = nextPage;
            }else{
                if (nextPage + 1 >= _localImageArr.count) {
                    index = 0;
                }else{
                    index = nextPage + 1;
                }
            }
            
            imageView.tag = index;
            //更新每一页上的图片
            [self setupLocalImageView:imageView atIndex:index];
        }//for
    }else if (_type == LQCarouselTypeWebImage){
        NSInteger nextPage = (currentPage + 1)%_webImageArr.count;
        self.pageControl.currentPage = nextPage;
        for (NSInteger i = 0; i< 3 ; i++) {
            UIImageView *imageView = _componentArr[i];
            NSInteger index;
            if (i == 0) {
                if (nextPage - 1 < 0) {
                    index = _webImageArr.count -1;
                }else{
                    index = nextPage -1;
                }
            }else if (i == 1){
                index = nextPage;
            }else{
                if (nextPage + 1 >= _webImageArr.count) {
                    index = 0;
                }else{
                    index = nextPage + 1;
                }
            }
            
            imageView.tag = index;
            //更新每一页上的图片
            [self setupWebImageView:imageView atIndex:index];
        }//for
    }
}



#pragma mark -- scrollView 的代理方法

//当你点击图片按住不动的时候 把定时器停止
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //停止定时器
    [self stopTimer];
}

//当不咋按图片，也就是松开的时候，立马调用计时器的方法
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self createTimer];
}



//当滑动减速停止时
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //根据scollView的位移判断 是往哪个方向滑动
    NSInteger sindex = scrollView.contentOffset.x / ViewWidth;
    NSInteger flag = 0;
    
    if (sindex == 0) {
        //往左移动
        flag = -1;
    }else if(sindex == 2){
        //往右移动
        flag = 1;
    }
    //根据不同的轮播类型进行页面更换
    switch (_type) {
       //网络图片
        case LQCarouselTypeWebImage:
        {
            for (UIImageView *imageView in _componentArr) {
                NSInteger index = imageView.tag + flag;
                if (index < 0) {
                    index = _webImageArr.count - 1;
                }else if(index >= _webImageArr.count){
                    index = 0;
                }//if
                imageView.tag = index;
                //更新每一页上的图片
                [self setupWebImageView:imageView atIndex:index];
            }//for
            
        }//casel
            break;
        //本地图片
        case LQCarouselTypeLocalImage:
        {
            for (UIImageView *imageView in _componentArr) {
                NSInteger index = imageView.tag + flag;
                if (index < 0) {
                    index = _localImageArr.count - 1;
                }else if(index >= _localImageArr.count){
                    index = 0;
                }//if
                imageView.tag = index;
                //更新每一页上的图片
                [self setupLocalImageView:imageView atIndex:index];
            }//for
            
        }//case
            break;
        //view
        case LQCarouselTypeView:
        {
            for (UIView *view in _componentArr) {
                NSInteger index = view.tag + flag;
                if (index < 0) {
                    index = _viewArr.count - 1;
                }else if(index >= _viewArr.count){
                    index = 0;
                }//if
                view.tag = index;
                //更新每页上的view
                [self setupView:view atIndex:index];

            }//for
            
        }//case
            break;
    }
    scrollView.contentOffset = CGPointMake(ViewWidth, 0);
    //中间显示的控件的tag值就是当前第几页
    _pageControl.currentPage = ((UIView *)_componentArr[1]).tag;
    if (self.delegate && [self.delegate respondsToSelector:@selector(scrollViewAtIndex:andType:)]) {
        [self.delegate scrollViewAtIndex:((UIView *)_componentArr[1]).tag andType:_type];
    }
    
}


@end
