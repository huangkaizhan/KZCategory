//
//  NSMutableDictionary+Category_kz.h
//  Category
//
//  Created by huangkaizhan on 2017/6/12.
//  Copyright © 2017年 baikailebeishui.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Category_kz)

/**
 根据key值设置对象

 @param anObject 对象
 @param aKey 键
 */
- (void)kz_setObject:(id)anObject forKey:(id<NSCopying>)aKey;

/**
 根据key值设置对象

 @param anObject 对象
 @param key 键
 */
- (void)kz_setObject:(id)anObject forKeyedSubscript:(id<NSCopying>)key;


/**
 删除指定key

 @param aKey aKey description
 */
- (void)kz_removeObjectForKey:(id)aKey;

/**
 对一个key设置非空的字符串值
 如果anobject为NSNumber,则设置为[NSNumber stringValue], 如果anobject为nil或者其他类型，则设置为@"",如果akey为nil, 则不设直接返回;

 @param anObject 要设置的值：要求是字符串类型
 @param aKey 要设置的key
 */
- (void)setStringObject:(id)anObject forKey:(id<NSCopying>)aKey;

/**
 对一个key设置非空值
 如果anobject为nil活着akey为nil, 则不设直接返回;

 @param anObject 要设置的值
 @param aKey 要设置的key
 */
- (void)setNotNilObject:(id)anObject forKey:(id<NSCopying>)aKey;

@end
