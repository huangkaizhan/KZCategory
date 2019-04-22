//
//  UIView+Category_kz.h
//  Category
//
//  Created by huangkaizhan on 2016/12/5.
//  Copyright © 2016年 baikailebeishui.cn. All rights reserved.
//  UIView分类

#import <UIKit/UIKit.h>

@interface UIView (Category_kz)

#pragma mark - 手势
/**
 *  添加单击手势
 */
- (void)addTapGestureWithTarget_kz:(id)target action:(SEL)action;

/**
 *  添加滑动手势
 */
- (void)addPanGestureWithTarget_kz:(id)target action:(SEL)action;

#pragma mark - 图片
/**
 *  截图
 *  @return 图片控件
 */
- (UIImageView *)shotImageView_kz;

/**
 *  截图
 *  @return 图片
 */
- (UIImage *)shotImage_kz;

/**
 截图
 
 @param scale 缩放系数
 @return 图片
 */
- (UIImage *)shotImageWithScale_kz:(CGFloat)scale;

#pragma mark - layer
/**
 *  变圆
 */
- (void)toCircle_kz;

/**
 *  设置圆角
 */
- (void)setCorner_kz:(CGFloat)corner;

#pragma mark - 控件操作

/**
 安全添加子控件
 
 @param view 子控件
 */
- (void)addSubviewSafe_kz:(UIView *)view;


/**
 安全插入子控件
 
 @param view 子控件
 @param index 索引
 */
- (void)insertSubviewSafe_kz:(UIView *)view atIndex:(NSInteger)index;

/**
 *  删除所有子控件
 */
- (void)removeAllSubviews_kz;

#pragma mark - frame
// 高度
- (CGFloat)height_kz;
- (void)setHeight_kz:(CGFloat)height;

// 宽度
- (CGFloat)width_kz;
- (void)setWidth_kz:(CGFloat)width;

// x坐标
- (CGFloat)x_kz;
- (void)setX_kz:(CGFloat)x;

// y坐标
- (CGFloat)y_kz;
- (void)setY_kz:(CGFloat)y;

- (CGFloat)centerX_kz;
-(void)setCenterX_kz:(CGFloat)centerX_kz;

- (CGFloat)centerY_kz;
-(void)setCenterY_kz:(CGFloat)centerY_kz;

/**
 计算在inView中的frame

 @param inView 大控件
 @return frame
 */
- (CGRect)relativeFrameInView:(UIView *)inView;
@end
