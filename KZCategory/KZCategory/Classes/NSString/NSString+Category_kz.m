//
//  NSString+Category_kz.m
//  Category
//
//  Created by huangkaizhan on 2016/12/5.
//  Copyright © 2016年 baikailebeishui.cn. All rights reserved.


#import "NSString+Category_kz.h"
#import <CommonCrypto/CommonHMAC.h>
#import "CategoryHeader_kz.h"

@implementation NSString (Category_kz)

// 转为MD5
- (NSString *)kz_MD5 
{
    const char * cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result ); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

// 根据字符串生成NSURL链接
- (NSURL *)kz_toURL 
{
    NSURL *url = [NSURL URLWithString:self];
    return url;
}

// 字符串通过切割创建UIColor对象
- (UIColor *)kz_toColorWithSeparatedString:(NSString *)sep
{
    UIColor *color = nil;
    NSArray *array = [self componentsSeparatedByString:sep];
    if (array.count == 3) {
        NSInteger r = [array.firstObject integerValue];
        NSInteger g = [array[1] integerValue];
        NSInteger b = [array[2] integerValue];
        color = [UIColor colorWithRed:r / 255.f green:g / 255.f blue:b / 255.f alpha:1.f];
    } else if (array.count == 4) {
        NSInteger r = [array.firstObject integerValue];
        NSInteger g = [array[1] integerValue];
        NSInteger b = [array[2] integerValue];
        NSInteger a = [array[3] integerValue];
        color = [UIColor colorWithRed:r / 255.f green:g / 255.f blue:b / 255.f alpha:a];
    }
    return color;
}

// 根据字符串主bundle生成NSURL链接
- (NSURL *)kz_toMainBundleURLWithExt:(NSString *)ext
{
    if (self.length) {
        return [[NSBundle mainBundle] URLForResource:self withExtension:ext];
    } else {
        return nil;
    }
}

// 自动追加_selected
- (NSString *)kz_toSelectedImageName
{
    return [NSString stringWithFormat:@"%@_selected",self];
}

// 自动追加_highlighted
- (NSString *)kz_toHighlightedImageName
{
    return [NSString stringWithFormat:@"%@_highlighted",self];
}

// 自动追加_disable
- (NSString *)kz_toDisableImageName
{
    return [NSString stringWithFormat:@"%@_disabled",self];
}

// encode url
- (NSString *)kz_urlEncode 
{
    //    if ([[UIDevice currentDevice].systemVersion floatValue] >= 9.0) {
    //        NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@":/?#[]@!$&’`()*+,;="].invertedSet;
    //        return [self stringByAddingPercentEncodingWithAllowedCharacters:set];
    //    } else {
    NSString *result = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, NULL, CFSTR(":/?#[]@!$&'’()*+,;="), kCFStringEncodingUTF8);
    return [result autorelease];
    //    }
}

// decode url
- (NSString *)kz_urlDecode 
{
    NSString *result = [self stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 9.0) {
        result = [result stringByRemovingPercentEncoding];
    } else {
        result = [result stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    return result;
}

// 计算文本所占的尺寸
- (CGSize)kz_sizeWithMaxSize:(CGSize)maxsize fontSize:(CGFloat)fontSize
{
    return [self boundingRectWithSize:maxsize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
}

// 去除emoji表情
- (NSString *)kz_stringWithoutEmoji
{
    __block NSString *result = self;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         const unichar hs = [substring characterAtIndex:0];
         // surrogate pair
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     result = [result stringByReplacingOccurrencesOfString:substring withString:@""];
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3) {
                 result = [result stringByReplacingOccurrencesOfString:substring withString:@""];
             }
             
         } else {
             // non surrogate
             if (0x2100 <= hs && hs <= 0x27ff) {
                 result = [result stringByReplacingOccurrencesOfString:substring withString:@""];
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 result = [result stringByReplacingOccurrencesOfString:substring withString:@""];
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 result = [result stringByReplacingOccurrencesOfString:substring withString:@""];
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 result = [result stringByReplacingOccurrencesOfString:substring withString:@""];
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                 result = [result stringByReplacingOccurrencesOfString:substring withString:@""];
             }
         }
     }];
    
    return result;
}

//是否是gif链接
- (BOOL)kz_isGifUrl
{
    return ([self rangeOfString:@".gif"].location != NSNotFound ||
            [self rangeOfString:@".GIF"].location != NSNotFound);
}

#pragma mark - 安全方法
/**
 根据range截取字符串（安全）
 
 @param range 范围
 @return 截取后字符串
 */
- (NSString *)kz_substringWithRange:(NSRange)range
{
    if (range.location + range.length <= self.length) {
        return [self substringWithRange:range];
    } else {
        // 异常记录报告
        #warning <#message#>
        return @"";
    }
}

/**
 根据index截取字符串（安全）
 
 @param to 索引
 @return 截取后字符串
 */
- (NSString *)kz_substringToIndex:(NSUInteger)to
{
    if (to <= self.length) {
        return [self substringToIndex:to];
    } else {
        // 异常记录报告
        #warning <#message#>
        return @"";
    }
}
@end

