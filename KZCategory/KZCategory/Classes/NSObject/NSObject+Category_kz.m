//
//  NSObject+Category_kz.m
//  Category
//
//  Created by huangkaizhan on 2017/6/12.
//  Copyright © 2017年 baikailebeishui.cn. All rights reserved.
//

#import "NSObject+Category_kz.h"
#import <objc/runtime.h>
#import "CategoryHeader_kz.h"

@implementation NSObject (Category_kz)

- (void)kz_setValueSafe:(id)value forKey:(NSString *)key
{
    BOOL hasKey = [self hasKey_kz:key];
    if (hasKey) {
        [self setValue:value forKey:key];
    } else {
        // 异常记录上报
        [KZReport reportExceptionWithType:KZReportExceptionTypeCustom navigationController:nil exceptionData:nil extraInfo:nil reason:@"私有属性赋值失败：【kz_setValueSafe:forKey:】"];
    }
}


- (BOOL)hasKey_kz:(NSString *)key
{
    NSMutableArray *array = [self getProperties];
    for (NSString *p in array) {
        if ([p isEqualToString:key]) {
            return YES;
        }
    }
    return NO;
}

- (NSMutableArray <NSString *>*)getProperties
{
    NSMutableArray *propertyArray = [NSMutableArray array];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *p = [NSString stringWithUTF8String:property_getName(property)];
        if (p.length) {
            [propertyArray addObject:p];
        }
    }
    return propertyArray;
}


// 对象是否注册了key的通知监听
+ (BOOL)kz_object:(NSObject *)object hasOberverKey:(NSString *)key
{
    id info = object.observationInfo;
    NSArray *array = [info valueForKey:@"_observances"];
    for (id objc in array) {
        id Properties = [objc valueForKeyPath:@"_property"];
        NSString *keyPath = [Properties valueForKeyPath:@"_keyPath"];
        if ([key isEqualToString:keyPath]) {
            return YES;
        }
    }
    return NO;
}

#pragma mark - 判断

- (BOOL)kz_isStringNilObject 
{
    if ([self isKindOfClass:[NSString class]] && self) {
        return NO;
    }
    return YES;
}

// 字符串长度是否为0
- (BOOL)kz_isStringEmptyObject 
{
    if (!self) {
        return YES;
    }
    if (![self isKindOfClass:[NSString class]]) {
        return YES;
    }
    return !((NSString *)self).length;
}

/**
 判断字符串类型是否匹配
 
 @param object object description
 @return return value description
 */
+ (BOOL)kz_isNSStringClass:(id)object{
    if ([object isKindOfClass:[NSString class]]) {
        return YES;
    }
    return NO;
}

/**
 判断字典类型是否匹配
 
 @param object object description
 @return return value description
 */
+ (BOOL)kz_isNSDictionaryClass:(id)object{
    if ([object isKindOfClass:[NSDictionary class]]) {
        return YES;
    }
    return NO;
}

/**
 判断数字类型是否匹配
 
 @param object object description
 @return return value description
 */
+ (BOOL)kz_isNSNumberClass:(id)object{
    if ([object isKindOfClass:[NSNumber class]]) {
        return YES;
    }
    return NO;
}

/**
 判断为空类型是否匹配
 
 @param object object description
 @return return value description
 */
+ (BOOL)kz_isNSNullClass:(id)object{
    if ([object isKindOfClass:[NSNull class]]) {
        return YES;
    }
    return NO;
}

/**
 判断数组类型是否匹配
 
 @param object object description
 @return return value description
 */
+ (BOOL)kz_isNSArrayClass:(id)object{
    if ([object isKindOfClass:[NSArray class]]) {
        return YES;
    }
    return NO;
}

/**
 执行performSelector
 
 @param aSelector aSelector description
 @param objects objects description
 @return return value description
 */
- (id)kz_performSelector:(SEL)aSelector withObjects:(NSArray *)objects{
    
    NSMethodSignature *methodSignature = [self methodSignatureForSelector:aSelector];
    if (!methodSignature) {
        return nil;
    }
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    
    invocation.target = self;
    invocation.selector = aSelector;
    
    //签名中方法参数的个数，内部包含了self和_cmd，所以参数从第3个开始
    NSUInteger argumentCount = methodSignature.numberOfArguments - 2;
    NSUInteger loopCount = MIN(argumentCount, objects.count);
    
    for (NSUInteger idx = 0; idx < loopCount; idx++) {
        id obj = objects[idx];
        [invocation setArgument:&obj atIndex:idx + 2];
    }
    
    [invocation invoke];
    
    // 添加__weak 避免出现野指针错误问题
    __weak id callBackObject = nil;
    if(methodSignature.methodReturnLength) {
        [invocation getReturnValue:&callBackObject];
    }
    return callBackObject;
}

@end
