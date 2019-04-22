//
//  UIBarButtonItem+Category_kz.h
//  Category
//
//  Created by huangkaizhan on 2016/12/22.
//  Copyright © 2016年 baikailebeishui.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Category_kz)

// 导航箭头返回  ->   <
+ (instancetype)kz_itemWithArrowWithAction:(SEL)action target:(id)target;

// 图片Icon
+ (instancetype)kz_itemWithIcon:(UIImage *)icon  action:(SEL)action target:(id)target;

// 标题带箭头items  ->  <标题
+ (NSArray *)kz_leftkz_itemsWithTitle:(NSString *)title action:(SEL)action target:(id)target;

// 单纯标题
+ (NSArray *)kz_itemsWithTitle:(NSString *)title action:(SEL)action target:(id)target;

// 单纯标题 + 标题颜色
+ (NSArray *)kz_itemsWithTitle:(NSString *)title action:(SEL)action target:(id)target color:(UIColor*)color;

@end
