//
//  UIView+UIActivityIndicatorView.m
//  Category
//
//  Created by huangkaizhan on 2017/8/4.
//  Copyright © 2017年 baikailebeishui.cn. All rights reserved.
//

#import "UIView+UIActivityIndicatorView_kz.h"
#import "objc/runtime.h"

static const void *kFlowerKey = &kFlowerKey;

@implementation UIView (UIActivityIndicatorView_kz)

- (void)setFlowerView_kz:(UIActivityIndicatorView *)flowerView_kz 
{
    objc_setAssociatedObject(self, kFlowerKey, flowerView_kz , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIActivityIndicatorView *)flowerView_kz 
{
    return objc_getAssociatedObject(self, kFlowerKey);
}

/**
 初始化菊花
 */
- (void)setupFlowerView_kz 
{
    self.flowerView_kz = [[UIActivityIndicatorView alloc] init];
    [self addSubview:self.flowerView_kz];
    self.flowerView_kz.bounds = CGRectMake(0, 0, 50, 50);
    self.flowerView_kz.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
}

/**
 显示菊花
 */
- (void)showFlower_kz 
{
    if (!self.flowerView_kz) {
        [self setupFlowerView_kz];
    }
    [self.flowerView_kz startAnimating];
}

/**
 隐藏菊花
 */
- (void)hideFlower_kz 
{
    [self.flowerView_kz stopAnimating];
}

@end

