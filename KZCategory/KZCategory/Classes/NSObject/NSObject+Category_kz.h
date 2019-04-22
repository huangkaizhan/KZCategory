//
//  NSObject+Category_kz.h
//  Category
//
//  Created by huangkaizhan on 2017/6/12.
//  Copyright © 2017年 baikailebeishui.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Category_kz)


/**
 安全使用setValue

 @param value 值
 @param key 健
 */
- (void)kz_setValueSafe:(id)value forKey:(NSString *)key;

/**
 对象是否注册了key的通知监听
 
 @param object 对象
 @param key 监听key
 @return 是否
 */
+ (BOOL)kz_object:(NSObject *)object hasOberverKey:(NSString *)key;

/**
 是否是字符串对象，并且不为nil

 @return 布尔值
 */
- (BOOL)kz_isStringNilObject;

/**
 字符串长度是否为0

 @return 布尔值
 */
- (BOOL)kz_isStringEmptyObject;

/**
 判断字符串类型是否匹配

 @param object object description
 @return return value description
 */
+ (BOOL)kz_isNSStringClass:(id)object;

/**
 判断字典类型是否匹配

 @param object object description
 @return return value description
 */
+ (BOOL)kz_isNSDictionaryClass:(id)object;

/**
 判断数字类型是否匹配

 @param object object description
 @return return value description
 */
+ (BOOL)kz_isNSNumberClass:(id)object;

/**
 判断为空类型是否匹配

 @param object object description
 @return return value description
 */
+ (BOOL)kz_isNSNullClass:(id)object;

/**
 判断数组类型是否匹配

 @param object object description
 @return return value description
 */
+ (BOOL)kz_isNSArrayClass:(id)object;

/**
 执行performSelector
 
 @param aSelector aSelector description
 @param objects objects description
 @return return value description
 */
- (id)kz_performSelector:(SEL)aSelector withObjects:(NSArray *)objects;

@end
