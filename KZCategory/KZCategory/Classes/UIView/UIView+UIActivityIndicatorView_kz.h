//
//  UIView+UIActivityIndicatorView.h
//  Category
//
//  Created by huangkaizhan on 2017/8/4.
//  Copyright © 2017年 baikailebeishui.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UIActivityIndicatorView_kz)


/**
 菊花，如果要设置它的属性，那么要提前调用初始化方法，
 */
@property (nonatomic, strong) UIActivityIndicatorView *flowerView_kz;


/**
 初始化菊花
 */
- (void)setupFlowerView_kz;

/**
 显示菊花，可不用初始化直接调用
 */
- (void)showFlower_kz;


/**
 隐藏菊花，可不用初始化直接调用
 */
- (void)hideFlower_kz;

@end
