//
//  NSArray+Category_kz.h
//  Category
//
//  Created by huangkaizhan on 2017/6/9.
//  Copyright © 2017年 baikailebeishui.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Category_kz)


/**
 根据索引获取对象，如果没有则为nil
 
 @param index 索引
 @return 对象
 */
- (id)kz_objectAtIndexSafe:(NSUInteger)index;

/**
 根据对象创建数组
 
 @param anObject 对象
 @return 数组
 */
+ (NSArray *)kz_arrayWithObjectSafe:(id)anObject;


/**
 根据数组创建数组
 
 @param array 数组
 @return 数组
 */
+ (NSArray *)kz_arrayWithArraySafe:(NSArray<id> *)array;


/**
 对数组进行反序生成新数组 1 2 -> 2 1
 
 @return 新数组
 */
- (NSMutableArray *)reverse;


/**
 对数组新增反序的数组，生成新数组 1 2 -> 1 2 2 1
 
 @return 新数组
 */
- (NSMutableArray *)addReverse;
@end

