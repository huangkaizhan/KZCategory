//
//  UINavigationItem+Category_kz.h
//  Category
//
//  Created by huangkaizhan on 2016/12/23.
//  Copyright © 2016年 baikailebeishui.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationItem (Category_kz)

/** 添加导航栏左边按钮（只显示文字） */
- (void)kz_addLeftItemWithTitle:(NSString *)title action:(SEL)action target:(id)target;

/** 添加导航栏左边按钮（只显示图片） */
- (void)kz_addLeftkz_itemWithIcon:(UIImage *)icon action:(SEL)action target:(id)target;

/** 添加导航栏左边按钮（显示图片+标题，图片默认是箭头） */
- (void)kz_addLeftItemsWithArrowIconAndTitle:(NSString *)title action:(SEL)action target:(id)target;

/** 添加导航栏右边按钮（只显示文字） */
- (void)kz_addRightItemWithTitle:(NSString *)title action:(SEL)action target:(id)target;

/** 添加导航栏右边按钮（只显示图片） */
- (void)kz_addRightkz_itemWithIcon:(UIImage *)icon action:(SEL)action target:(id)target;

/** 添加导航栏右边按钮（只显示文字）+ 标题颜色 */
- (void)kz_addRightItemWithTitle:(NSString *)title action:(SEL)action target:(id)target color:(UIColor*)color;

//添加导航栏标题
- (void)kz_addSimpleTitleView:(NSString *)title FontSize:(UIFont *)font MaxWidth:(float)maxWidth MaxHeight:(float)maxHeight;

- (void)kz_addSimpleTitleView:(NSString *)title titleColor:(UIColor *)titleColor FontSize:(UIFont *)font MaxWidth:(float)maxWidth MaxHeight:(float)maxHeight;
@end
