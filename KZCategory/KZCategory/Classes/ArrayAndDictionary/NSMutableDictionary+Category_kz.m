//
//  NSMutableDictionary+Category_kz.m
//  Category
//
//  Created by huangkaizhan on 2017/6/12.
//  Copyright © 2017年 baikailebeishui.cn. All rights reserved.
//

#import "CategoryHeader_kz.h"
#import "NSMutableDictionary+Category_kz.h"

@implementation NSMutableDictionary (Category_kz)

/**
 根据key值设置对象
 
 @param anObject 对象
 @param aKey 键
 */
- (void)kz_setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    if (anObject && aKey) {
        [self setObject:anObject forKey:aKey];
    } else {
        // 异常记录上报
        [KZReport reportExceptionWithType:KZReportExceptionTypeCustom navigationController:nil exceptionData:nil extraInfo:nil reason:@"可变字典赋值失败：【setObjectSafe:forKey:】"];
    }
}

/**
 根据key值设置对象
 
 @param anObject 对象
 @param key 键
 */
- (void)kz_setObject:(id)anObject forKeyedSubscript:(id<NSCopying>)key
{
    if (anObject && key) {
        [self setObject:anObject forKeyedSubscript:key];
    } else {
        // 异常记录上报
        [KZReport reportExceptionWithType:KZReportExceptionTypeCustom navigationController:nil exceptionData:nil extraInfo:nil reason:@"可变字典赋值失败：【setObjectSafe:forKeyedSubscript:】"];
    }
}

/**
 删除指定key
 
 @param aKey aKey description
 */
- (void)kz_removeObjectForKey:(id)aKey{
    if (aKey) {
        [self removeObjectForKey:aKey];
    }else{
        // 异常记录上报
        [KZReport reportExceptionWithType:KZReportExceptionTypeCustom navigationController:nil exceptionData:nil extraInfo:nil reason:@"删除失败：【kz_removeObjectForKey:】"];
    }
}

/**
 对一个key设置非空的字符串值，如果anobject为NSNumber,则设置为[NSNumber stringValue], 如果anobject为nil或者其他类型，则设置为@"",如果akey为nil, 则不设直接返回;
 
 @param anObject 要设置的值：要求是字符串类型
 @param aKey 要设置的key
 */
- (void)setStringObject:(id)anObject forKey:(id<NSCopying>)aKey{
    if (!aKey) {
        // 异常记录上报
        [KZReport reportExceptionWithType:KZReportExceptionTypeCustom navigationController:nil exceptionData:nil extraInfo:nil reason:@"可变字典赋值失败：【setStringObject:forKey:】"];
        return;
    }
    if ([NSObject kz_isNSNumberClass:anObject]) {
        [self setObject:[((NSNumber *)anObject) stringValue] forKey:aKey];
        return;
    }
    if (anObject == nil || [NSObject kz_isNSNullClass:anObject] || ![NSObject kz_isNSStringClass:anObject]) {
        [self setObject:@"" forKey:aKey];
    } else {
        [self setObject:anObject forKey:aKey];
    }
}

/**
 对一个key设置非空值, 如果anobject为nil活着akey为nil, 则不设直接返回;
 
 @param anObject 要设置的值
 @param aKey 要设置的key
 */
- (void)setNotNilObject:(id)anObject forKey:(id<NSCopying>)aKey{
    if (aKey == nil || anObject == nil || [NSObject kz_isNSNullClass:anObject]) {
        // 异常记录上报
        [KZReport reportExceptionWithType:KZReportExceptionTypeCustom navigationController:nil exceptionData:nil extraInfo:nil reason:@"可变字典赋值失败：【setNotNilObject:forKey:】"];
        return;
    } else {
        [self setObject:anObject forKey:aKey];
    }
}

@end
