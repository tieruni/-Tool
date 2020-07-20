//
//  LJtGhVRMFsQtXr.h
//  WMZBanner
//
//  Created by wmz on 2019/9/6.
//  Copyright © 2019 wmz. All rights reserved.
//

#import "LJtGhMOVUviZaMUrUMlhI.h"
NS_ASSUME_NONNULL_BEGIN

@interface LJtGhVRMFsQtXr : UIView
//背景图
@property(strong,nonatomic)UIImageView *bgImgView;

/**
 *  调用方法
 *
 */
- (instancetype)initConfigureWithModel:(LJtGhMOVUviZaMUrUMlhI *)param withView:(UIView*)parentView;

/**
 *  调用方法
 *
 */
- (instancetype)initConfigureWithModel:(LJtGhMOVUviZaMUrUMlhI *)param;
/**
 *  更新UI
 *
 */
- (void)updateUI;


/**
*  手动调用滚动
*
*/
- (void)scrolToPath:(NSIndexPath*)path animated:(BOOL)animated;

@end

@interface Collectioncell : UICollectionViewCell
@property(nonatomic,strong)UIImageView *icon;
@property(nonatomic,strong)LJtGhMOVUviZaMUrUMlhI *param;
@end

@interface CollectionTextCell : UICollectionViewCell
@property(nonatomic,strong)UILabel *label;
@property(nonatomic,strong)LJtGhMOVUviZaMUrUMlhI *param;
@end

NS_ASSUME_NONNULL_END
