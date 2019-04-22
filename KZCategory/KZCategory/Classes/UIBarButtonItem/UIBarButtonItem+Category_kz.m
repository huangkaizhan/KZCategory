//
//  UIBarButtonItem+Category_kz.m
//  Category
//
//  Created by huangkaizhan on 2016/12/22.
//  Copyright © 2016年 baikailebeishui.cn. All rights reserved.
//

// 分类头文件
#import "CategoryHeader_kz.h"
#import "UIBarButtonItem+Category_kz.h"

// 图片宏
#define BBCategoryeImage(imgName)                  Image_From_Named_kz (@"Category_kz", (imgName))

@implementation UIBarButtonItem (Category_kz)

// 文字大小
static CGFloat ItemFontSize = 15;

+ (instancetype)kz_itemWithArrowWithAction:(SEL)action target:(id)target
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:BBCategoryeImage(@"icon_back_kz") forState:UIControlStateNormal];
    [button setImage:BBCategoryeImage(@"icon_back_kz") forState:UIControlStateHighlighted];
    CGFloat width = button.currentImage.size.width + 15;
    button.frame = (CGRect){CGPointZero, CGSizeMake(width, 44)};
    if (target && action) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    return item;
}

+ (instancetype)kz_itemWithIcon:(UIImage *)icon action:(SEL)action target:(id)target
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:icon forState:UIControlStateNormal];
    [button setImage:icon forState:UIControlStateHighlighted];
    CGFloat width = button.currentImage.size.width + 15;
    button.frame = (CGRect){CGPointZero, CGSizeMake(width, 44)};
    if (target && action) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    return item;
}

+ (NSArray *)kz_leftkz_itemsWithTitle:(NSString *)title action:(SEL)action target:(id)target
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:BBCategoryeImage(@"icon_back_kz") forState:UIControlStateNormal];
    [button setImage:BBCategoryeImage(@"icon_back_kz") forState:UIControlStateHighlighted];
    NSDictionary *attr = @{NSFontAttributeName : [UIFont systemFontOfSize:ItemFontSize]};
    CGFloat width = [title boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attr context:nil].size.width + button.currentImage.size.width + 15;
    button.frame = (CGRect){CGPointZero, CGSizeMake(width, 44)};
    [button setTitle:title forState:UIControlStateNormal];
    CGFloat colorNum = 51 / 255.0;
    UIColor *color = [UIColor colorWithRed:colorNum green:colorNum blue:colorNum alpha:1];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:ItemFontSize];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    UIBarButtonItem *fixItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixItem.width = -8;
    return @[fixItem, item];
}

// 导航栏右侧
+ (NSArray *)kz_itemsWithTitle:(NSString *)title action:(SEL)action target:(id)target
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    NSDictionary *attr = @{NSFontAttributeName : [UIFont systemFontOfSize:ItemFontSize]};
    CGFloat width = [title boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attr context:nil].size.width;
    button.frame = (CGRect){CGPointZero, CGSizeMake(width, 44)};
    [button setTitle:title forState:UIControlStateNormal];
    CGFloat colorNum = 51 / 255.0;
    UIColor *color = [UIColor colorWithRed:colorNum green:colorNum blue:colorNum alpha:1];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:ItemFontSize];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    //    UIBarButtonItem *fixItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    //    fixItem.width = -8;
    return @[item];
}

// 单纯标题
+ (NSArray *)kz_itemsWithTitle:(NSString *)title action:(SEL)action target:(id)target color:(UIColor*)color
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    NSDictionary *attr = @{NSFontAttributeName : [UIFont systemFontOfSize:ItemFontSize]};
    CGFloat width = [title boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attr context:nil].size.width;
    button.frame = (CGRect){CGPointZero, CGSizeMake(width, 44)};
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:ItemFontSize];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    return @[item];
}
@end

