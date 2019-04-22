//
//  NSArray+Category_kz.m
//  Category
//
//  Created by huangkaizhan on 2017/6/9.
//  Copyright © 2017年 baikailebeishui.cn. All rights reserved.
//

#import "NSArray+Category_kz.h"
#import <objc/runtime.h>
#import <Foundation/NSObject.h>
#import <Foundation/NSEnumerator.h>
#import <Foundation/NSRange.h>
#import <Foundation/NSObjCRuntime.h>
#import "CategoryHeader_kz.h"

@implementation NSArray (Category_kz)

// 根据索引获取对象，如果没有则为nil
- (id)kz_objectAtIndexSafe:(NSUInteger)index
{
    id object = nil;
    if (index < self.count) {
        object = self[index];
    } else {
        // 异常记录上报
        [KZReport reportExceptionWithType:KZReportExceptionTypeCustom navigationController:nil exceptionData:nil extraInfo:nil reason:[NSString stringWithFormat:@"数组越界：%@",NSStringFromSelector(_cmd)]];
    }
    return object;
}


// 根据对象创建数组
+ (NSArray *)kz_arrayWithObjectSafe:(id)anObject
{
    NSArray *array = nil;
    if (anObject) {
        array = [self arrayWithObject:anObject];
    } else {
        // 异常记录上报
        [KZReport reportExceptionWithType:KZReportExceptionTypeCustom navigationController:nil exceptionData:nil extraInfo:nil reason:[NSString stringWithFormat:@"空对象：%@",NSStringFromSelector(_cmd)]];
        array = @[];
    }
    return array;
}

// 根据数组创建数组
+ (NSArray *)kz_arrayWithArraySafe:(NSArray<id> *)array
{
    NSArray *newArray = nil;
    if (array) {
        newArray = [NSArray arrayWithArray:array];
    } else {
        // 异常记录上报
        [KZReport reportExceptionWithType:KZReportExceptionTypeCustom navigationController:nil exceptionData:nil extraInfo:nil reason:[NSString stringWithFormat:@"空数组：%@",NSStringFromSelector(_cmd)]];
        newArray = @[];
    }
    return newArray;
}

// 对数组进行反序生成新数组
- (NSMutableArray *)reverse
{
    NSMutableArray *newArray = [NSMutableArray array];
    for (NSInteger i = self.count - 1; i >= 0; i--) {
        [newArray addObject:self[i]];
    }
    return newArray;
}

// 对数组新增反序的数组，生成新数组 1 2 -> 1 2 2 1
- (NSMutableArray *)addReverse
{
    NSMutableArray *newArray = [NSMutableArray arrayWithArray:self];
    NSMutableArray *reverseArray = [self reverse];
    [newArray addObjectsFromArray:reverseArray];
    return newArray;
}
@end

