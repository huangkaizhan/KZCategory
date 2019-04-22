//
//  NSMutableArray+Category_kz.m
//  Category
//
//  Created by huangkaizhan on 2017/6/9.
//  Copyright © 2017年 baikailebeishui.cn. All rights reserved.
//

#import "CategoryHeader_kz.h"
#import "NSMutableArray+Category_kz.h"
#import <objc/runtime.h>

@implementation NSMutableArray (Category_kz)

#pragma mark - 增
// 添加对象
- (void)kz_addObjectSafe:(id)anObject
{
    if (anObject) {
        [self addObject:anObject];
    } else {
        // 异常记录上报
        [KZReport reportExceptionWithType:KZReportExceptionTypeCustom navigationController:nil exceptionData:nil extraInfo:nil reason:[NSString stringWithFormat:@"空对象：%@",NSStringFromSelector(_cmd)]];
    }
}

// 添加多个对象
- (void)kz_addObjectsFromArraySafe:(NSArray *)otherArray
{
    if (otherArray) {
        [self addObjectsFromArray:otherArray];
    } else {
        // 异常记录上报
        [KZReport reportExceptionWithType:KZReportExceptionTypeCustom navigationController:nil exceptionData:nil extraInfo:nil reason:[NSString stringWithFormat:@"空数组：%@",NSStringFromSelector(_cmd)]];
    }
}

// 插入对象
- (void)kz_insertObjectSafe:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject && index <= self.count) {
        [self insertObject:anObject atIndex:index];
    } else {
        // 异常记录上报
        if(!anObject) {
            [KZReport reportExceptionWithType:KZReportExceptionTypeCustom navigationController:nil exceptionData:nil extraInfo:nil reason:[NSString stringWithFormat:@"空对象：%@",NSStringFromSelector(_cmd)]];
        } else {
            [KZReport reportExceptionWithType:KZReportExceptionTypeCustom navigationController:nil exceptionData:nil extraInfo:nil reason:[NSString stringWithFormat:@"数组越界：%@",NSStringFromSelector(_cmd)]];
        }
    }
}

#pragma mark - 删
// 移除对象
- (void)kz_removeObjectAtIndexSafe:(NSUInteger)index
{
    if (index < self.count) {
        [self removeObjectAtIndex:index];
    } else {
        // 异常记录上报
        [KZReport reportExceptionWithType:KZReportExceptionTypeCustom navigationController:nil exceptionData:nil extraInfo:nil reason:[NSString stringWithFormat:@"数组越界：%@",NSStringFromSelector(_cmd)]];
    }
}

// 移除对象
- (void)kz_removeObjectSafe:(id)anObject
{
    if (anObject) {
        [self removeObject:anObject];
    } else {
        // 异常记录上报
        [KZReport reportExceptionWithType:KZReportExceptionTypeCustom navigationController:nil exceptionData:nil extraInfo:nil reason:[NSString stringWithFormat:@"空对象：%@",NSStringFromSelector(_cmd)]];
    }
}

#pragma mark - 改
// 替换对象
- (void)kz_replaceObjectAtIndexSafe:(NSUInteger)index withObject:(id)anObject
{
    if (index < self.count && anObject) {
        [self replaceObjectAtIndex:index withObject:anObject];
    } else {
        // 异常记录上报
        if(!anObject) {
            [KZReport reportExceptionWithType:KZReportExceptionTypeCustom navigationController:nil exceptionData:nil extraInfo:nil reason:[NSString stringWithFormat:@"空对象：%@",NSStringFromSelector(_cmd)]];
        } else {
            [KZReport reportExceptionWithType:KZReportExceptionTypeCustom navigationController:nil exceptionData:nil extraInfo:nil reason:[NSString stringWithFormat:@"数组越界：%@",NSStringFromSelector(_cmd)]];
        }
    }
}
@end
