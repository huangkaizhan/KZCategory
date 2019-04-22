//
//  NSDictionary+Category_kz.m
//  Category
//
//  Created by huangkaizhan on 2017/6/9.
//  Copyright © 2017年 baikailebeishui.cn. All rights reserved.
//

#import "CategoryHeader_kz.h"
#import "NSDictionary+Category_kz.h"
#import "NSObject+Category_kz.h"

@implementation NSDictionary (Category_kz)

#pragma mark - 解决输出乱码

- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [strM appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [strM appendString:@"}\n"];
    
    return strM;
}

#pragma mark - 初始化字典

+ (instancetype)kz_dictionaryWithObject:(id)object forKey:(id<NSCopying>)key
{
    NSDictionary *dict = nil;
    if (key && object) {
        dict = [self dictionaryWithObject:object forKey:key];
    } else {
        dict = @{};
        // 异常记录上报
        [KZReport reportExceptionWithType:KZReportExceptionTypeCustom navigationController:nil exceptionData:nil extraInfo:nil reason:@"初始化字典失败：【dictionaryWithObjectSafe:forKey:】"];
    }
    return dict;
}

// 根据字典初始化字典
+ (instancetype)kz_dictionaryWithDictionary:(NSDictionary *)dict
{
    NSDictionary *newDict = nil;
    if (dict.count) {
        newDict = [self dictionaryWithDictionary:dict];
    } else {
        newDict = @{};
        // 异常记录上报
        [KZReport reportExceptionWithType:KZReportExceptionTypeCustom navigationController:nil exceptionData:nil extraInfo:nil reason:@"初始化字典失败：【dictionaryWithDictionarySafe:】"];
    }
    return newDict;
}

// 初始化字典
+ (instancetype)kz_dictionaryWithObjects:(NSArray *)objects forKeys:(NSArray<NSCopying> *)keys
{
    NSDictionary *dict = nil;
    if (objects.count && keys.count && objects.count == keys.count) {
        dict = [self dictionaryWithObjects:objects forKeys:keys];
    } else {
        dict = @{};
        // 异常记录上报
        [KZReport reportExceptionWithType:KZReportExceptionTypeCustom navigationController:nil exceptionData:nil extraInfo:nil reason:@"初始化字典失败：【dictionaryWithObjectsSafe:forKeys:】"];
    }
    return dict;
}

#pragma mark - 替换KEY

// 替换key的名称
-(NSDictionary *)kz_replacedKeyName:(NSString *)orginName replaceKey:(NSString*)replaceKey
{
    NSMutableDictionary * data = [[NSMutableDictionary alloc] initWithCapacity:0];
    
    if ([self allKeys].count > 0) {
        for (int i = 0; i < [self allKeys].count; i++) {
            if ([orginName isEqualToString:[[self allKeys] objectAtIndex:i]]) {
                NSString *tempValue = [self objectForKey:orginName];
                [data setObject:tempValue forKey:replaceKey];
            }else{
                NSString *tempKey =[[self allKeys] objectAtIndex:i];
                NSString *tempValue = [self objectForKey:tempKey];
                [data setObject:tempValue forKey:tempKey];
            }
        }
    }else{
        // 异常记录上报
        [KZReport reportExceptionWithType:KZReportExceptionTypeCustom navigationController:nil exceptionData:nil extraInfo:nil reason:@"替换KEY失败：【replacedKeyName:replaceKey:】"];
    }
    return data;
}

#pragma mark - 安全取值

/**
 判断是否包含了某一个key值
 
 @param key key值
 @return YES：b包含，NO：不包含
 */
- (BOOL)kz_avaliableForKey:(id)key{
    id object = [self objectForKey:key];
    if (object == nil || [object isKindOfClass:[NSNull class]]) {
        return NO;
    }
    return YES;
}

/**
 安全获取key键对应的value值
 
 @param key key值
 @return value值m，不存在的key键返回nil
 */
- (id)kz_objectForKey:(id)key{
    if ([self kz_avaliableForKey:key]) {
        id object = [self objectForKey:key];
        return object;
    }
    // 异常记录上报
    [KZReport reportExceptionWithType:KZReportExceptionTypeCustom navigationController:nil exceptionData:nil extraInfo:nil reason:@"安全获取key键对应的value值失败：【objectForKeySafe:】"];
    return nil;
}

/**
 获取key键对应的value值
 
 @param key key description
 @return return value description
 */
- (BOOL)kz_boolForKey:(id)key{
    id object = [self objectForKey:key];
    if (object == nil || [object isKindOfClass:[NSNull class]]) {
        return NO;
    } else if ([object isKindOfClass:[NSString class]]) {
        return [object boolValue];
    } else if ([object isKindOfClass:[NSNumber class]]) {
        return [object boolValue];
    }
    return NO;
}

/**
 获取key键对应的value值
 
 @param key key description
 @return return value description
 */
- (float)kz_floatForKey:(id)key{
    id object = [self objectForKey:key];
    if (object == nil || [object isKindOfClass:[NSNull class]]) {
        return 0;
    } else if ([object isKindOfClass:[NSString class]]) {
        return [object floatValue];
    } else if ([object isKindOfClass:[NSNumber class]]) {
        return [object floatValue];
    }
    return 0;
}

/**
 获取key键对应的value值
 
 @param key key description
 @return return value description
 */
- (int)kz_intForKey:(id)key{
    id object = [self objectForKey:key];
    if (object == nil || [object isKindOfClass:[NSNull class]]) {
        return 0;
    } else if ([object isKindOfClass:[NSString class]]) {
        return [object intValue];
    } else if ([object isKindOfClass:[NSNumber class]]) {
        return [object intValue];
    }
    return 0;
}

/**
 获取key键对应的value值
 
 @param key key description
 @return return value description
 */
- (NSString *)kz_stringForKey:(id)key{
    id object = [self objectForKey:key];
    if (object == nil || [object isKindOfClass:[NSNull class]]) {
        return @"";
    } else if ([object isKindOfClass:[NSString class]]) {
        return object;
    } else if ([object isKindOfClass:[NSNumber class]]) {
        return [object stringValue];
    }
    return @"";
}

/**
 获取key键对应的value值
 
 @param key key description
 @return return value description
 */
- (NSNumber *)kz_numberForKey:(id)key{
    id object = [self objectForKey:key];
    if (object == nil || [object isKindOfClass:[NSNull class]]) {
        return [NSNumber numberWithInt:0];
    } else if ([object isKindOfClass:[NSString class]]) {
        return [NSNumber numberWithLongLong:[object longLongValue]];
    } else if ([object isKindOfClass:[NSNumber class]]) {
        return object;
    }
    return [NSNumber numberWithInt:0];
}

/**
 获取key键对应的value值
 
 @param key key description
 @return return value description
 */
- (NSArray *)kz_arrayForKey:(id)key{
    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSArray class]]) {
        return object;
    }
    return [NSArray array];
}

@end
