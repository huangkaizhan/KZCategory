//
//  UINavigationItem+Category_kz.m
//  Category
//
//  Created by huangkaizhan on 2016/12/23.
//  Copyright © 2016年 baikailebeishui.cn. All rights reserved.
//

#import "CategoryHeader_kz.h"
#import "UINavigationItem+Category_kz.h"
#import "UIBarButtonItem+Category_kz.h"

@implementation UINavigationItem (Category_kz)

// 添加导航栏左边按钮（只显示文字)
- (void)kz_addLeftItemWithTitle:(NSString *)title action:(SEL)action target:(id)target
{
    self.leftBarButtonItems = [UIBarButtonItem kz_itemsWithTitle:title action:action target:target];
}

// 添加导航栏左边按钮（只显示图片）
- (void)kz_addLeftkz_itemWithIcon:(UIImage *)icon action:(SEL)action target:(id)target
{
    self.leftBarButtonItem = [UIBarButtonItem kz_itemWithIcon:icon action:action target:target];
}

// 添加导航栏左边按钮（显示图片+标题，图片默认是箭头)
- (void)kz_addLeftItemsWithArrowIconAndTitle:(NSString *)title action:(SEL)action target:(id)target
{
    self.leftBarButtonItems = [UIBarButtonItem kz_leftkz_itemsWithTitle:title action:action target:target];
}

// 添加导航栏右边按钮（只显示标题）
- (void)kz_addRightItemWithTitle:(NSString *)title action:(SEL)action target:(id)target
{
    self.rightBarButtonItems = [UIBarButtonItem kz_itemsWithTitle:title action:action target:target];
}


// 添加导航栏右边按钮（只显示图片）
- (void)kz_addRightkz_itemWithIcon:(UIImage *)icon action:(SEL)action target:(id)target
{
    self.rightBarButtonItem = [UIBarButtonItem kz_itemWithIcon:icon action:action target:target];
}

// 添加导航栏右边按钮（只显示标题）+ 标题颜色
- (void)kz_addRightItemWithTitle:(NSString *)title action:(SEL)action target:(id)target color:(UIColor*)color
{
     self.rightBarButtonItems = [UIBarButtonItem kz_itemsWithTitle:title action:action target:target color:color];
}

- (void)kz_addSimpleTitleView:(NSString *)title FontSize:(UIFont *)font MaxWidth:(float)maxWidth MaxHeight:(float)maxHeight{
    [self kz_addSimpleTitleView:title titleColor:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1] FontSize:font MaxWidth:maxWidth MaxHeight:maxHeight];
}

- (void)kz_addSimpleTitleView:(NSString *)title titleColor:(UIColor *)titleColor FontSize:(UIFont *)font MaxWidth:(float)maxWidth MaxHeight:(float)maxHeight
{
    
    UILabel * tl = nil;
    if (self.titleView && [self.titleView isKindOfClass:[UILabel class]]) {
        tl = (UILabel *) self.titleView;
        tl.textAlignment = NSTextAlignmentCenter;
        tl.text = title;
        tl.textColor = titleColor;
        [tl sizeToFit];
        //[tl autoHeightWithin:maxHeight];
    }else{
        
        tl = [[UILabel alloc] init];
        tl.textColor = titleColor;
        [tl setFrame:CGRectMake(0.0f, 0.0f, maxWidth, maxHeight)];
        tl.text = title;
        tl.backgroundColor = [UIColor clearColor];
        tl.font = font;
        tl.textAlignment = NSTextAlignmentCenter;
        tl.clipsToBounds = YES;
        
        //[tl autoHeightWithin:maxHeight];
        self.titleView = tl;
    }
}

@end
