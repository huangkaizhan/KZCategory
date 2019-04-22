//
//  NSDictionary+Category_kz.h
//  Category
//
//  Created by huangkaizhan on 2017/6/9.
//  Copyright © 2017年 baikailebeishui.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Category_kz)

#pragma mark - 初始化字典
/**
 初始化字典

 @param object 对象
 @param key 建
 @return 字典
 */
+ (instancetype)kz_dictionaryWithObject:(id)object forKey:(id<NSCopying>)key;


/**
 根据字典初始化字典

 @param dict 字典
 @return 新字典
 */
+ (instancetype)kz_dictionaryWithDictionary:(NSDictionary *)dict;

/**
 初始化字典

 @param objects 对象数组
 @param keys 键数组
 @return 新字典
 */
+ (instancetype)kz_dictionaryWithObjects:(NSArray *)objects forKeys:(NSArray<NSCopying> *)keys;


#pragma mark - 替换KEY

/**
 *  替换字典的key名称
 *
 *  @param orginName  原来的名称
 *
 *  @param replaceKey 替换的名称
 *
 *  @return 替换后的结果
 */
- (NSDictionary *)kz_replacedKeyName:(NSString *)orginName replaceKey:(NSString*)replaceKey;


#pragma mark - 安全取值

/**
 判断是否包含了某一个key值

 @param key key值
 @return YES：包含，NO：不包含
 */
- (BOOL)kz_avaliableForKey:(id)key;

/**
 获取key键对应的value值

 @param key key值
 @return value值，不存在的key键返回nil
 */
- (id)kz_objectForKey:(id)key;

/**
 获取key键对应的value值

 @param key key description
 @return return value description
 */
- (BOOL)kz_boolForKey:(id)key;

/**
 获取key键对应的value值

 @param key key description
 @return return value description
 */
- (float)kz_floatForKey:(id)key;

/**
 获取key键对应的value值

 @param key key description
 @return return value description
 */
- (int)kz_intForKey:(id)key;

/**
 获取key键对应的value值

 @param key key description
 @return return value description
 */
- (NSString *)kz_stringForKey:(id)key;

/**
 获取key键对应的value值

 @param key key description
 @return return value description
 */
- (NSNumber *)kz_numberForKey:(id)key;

/**
 获取key键对应的value值

 @param key key description
 @return return value description
 */
- (NSArray *)kz_arrayForKey:(id)key;


@end
