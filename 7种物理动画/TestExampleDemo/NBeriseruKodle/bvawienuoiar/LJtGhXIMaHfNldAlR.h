//
//  LJtGhXIMaHfNldAlR.h
//  WMZBanner
//
//  Created by wmz on 2019/9/6.
//  Copyright © 2019 wmz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJtGhMOVUviZaMUrUMlhI.h"
NS_ASSUME_NONNULL_BEGIN
@interface LJtGhXIMaHfNldAlR : UIPageControl
@property (nonatomic, strong) UIImage *currentImage;
@property (nonatomic, strong) UIImage *inactiveImage;
@property (nonatomic, assign) CGSize currentImageSize;
@property (nonatomic, assign) CGSize inactiveImageSize;
@property (nonatomic, strong) LJtGhMOVUviZaMUrUMlhI *param;
- (instancetype)initWithFrame:(CGRect)frame WithModel:(LJtGhMOVUviZaMUrUMlhI *)param;

@end

NS_ASSUME_NONNULL_END
