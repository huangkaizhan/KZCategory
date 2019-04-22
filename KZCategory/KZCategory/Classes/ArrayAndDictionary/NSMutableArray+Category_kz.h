//
//  NSMutableArray+Category_kz.h
//  Category
//
//  Created by huangkaizhan on 2017/6/9.
//  Copyright © 2017年 baikailebeishui.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/NSObject.h>

@interface NSMutableArray (Category_kz)


/**
 添加对象

 @param anObject 对象
 */
- (void)kz_addObjectSafe:(id)anObject;

/**
 添加多个对象

 @param otherArray 对象数组
 */
- (void)kz_addObjectsFromArraySafe:(NSArray *)otherArray;


/**
 插入对象

 @param anObject 对象
 @param index 索引
 */
- (void)kz_insertObjectSafe:(id)anObject atIndex:(NSUInteger)index;

/**
 移除对象

 @param index 索引
 */
- (void)kz_removeObjectAtIndexSafe:(NSUInteger)index;


/**
 移除对象

 @param anObject 对象
 */
- (void)kz_removeObjectSafe:(id)anObject;


/**
 替换对象

 @param index 索引
 @param anObject 对象
 */
- (void)kz_replaceObjectAtIndexSafe:(NSUInteger)index withObject:(id)anObject;
@end
