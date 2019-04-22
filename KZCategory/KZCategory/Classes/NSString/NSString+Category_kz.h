//
//  NSString+Category_kz.h
//  Category
//
//  Created by huangkaizhan on 2016/12/5.
//  Copyright © 2016年 baikailebeishui.cn. All rights reserved.
//  NSString分类， 存放一些常规用法

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Category_kz)

/**
 *  转为MD5
 *
 *  @return MD5密文
 */
- (NSString *)kz_MD5;

/**
 *  根据字符串生成NSURL链接
 */
- (NSURL *)kz_toURL;

/**
 字符串通过切割创建UIColor对象

 @param sep 切割字符串
 @return 颜色对象
 */
- (UIColor *)kz_toColorWithSeparatedString:(NSString *)sep;

/**
 根据字符串主bundle生成NSURL链接

 @param ext 扩展名
 @return 资源url
 */
- (NSURL *)kz_toMainBundleURLWithExt:(NSString *)ext;

/**
 *  自动追加_selected
 *
 *  @return 选中图片名
 */
- (NSString *)kz_toSelectedImageName;

/**
 *  自动追加_highlighted
 *
 *  @return 高亮图片名
 */
- (NSString *)kz_toHighlightedImageName;

/**
 *  自动追加_disable
 *
 *  @return 失效图片名
 */
- (NSString *)kz_toDisableImageName;

/**
 *  encode url
 */
- (NSString *)kz_urlEncode;

/**
 *  decode url
 */
- (NSString *)kz_urlDecode;

/**
 *  计算文本所占的尺寸
 *
 *  @param maxsize  限制文本最大的尺寸
 *  @param fontSize 字体大小
 *
 *  @return 计算好的尺寸
 */
- (CGSize)kz_sizeWithMaxSize:(CGSize)maxsize fontSize:(CGFloat)fontSize;

/**
 *  去除emoji表情(可用在注册用户名，标题上)
 *
 *  @return 去除emoji表情后的字符串
 */
- (NSString *)kz_stringWithoutEmoji;
/**
 是否是gif链接
 
 @return 返回gif链接
 */
- (BOOL)kz_isGifUrl;

#pragma mark - 安全方法
/**
 根据range截取字符串（安全）

 @param range 范围
 @return 截取后字符串
 */
- (NSString *)kz_substringWithRange:(NSRange)range;

/**
 根据index截取字符串（安全）

 @param to 索引
 @return 截取后字符串
 */
- (NSString *)kz_substringToIndex:(NSUInteger)to;
@end
