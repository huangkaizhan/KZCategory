//
//  NSDate+Category_kz.h
//  Category
//
//  Created by huangkaizhan on 2016/12/5.
//  Copyright © 2016年 baikailebeishui.cn. All rights reserved.
//  日期分类

#import <Foundation/Foundation.h>

#define DateFormatYear @"yyyy"
#define DateFormatMonth @"yyyy-MM"
#define DateFormatDay @"yyyy-MM-dd"
#define DateFormatDayChinese @"yyyy年MM月dd日"
#define DateFormatMinute @"yyyy-MM-dd HH:mm"
#define DateFormatDayDot @"yyyy.MM.dd"

@interface NSDate (Category_kz)

#pragma mark - 格式化
/**
 *  根据格式把NSDate转换为字符串日期
 *
 *  @param format 转换格式
 *
 *  @return 格式化字符串
 */
- (NSString *)kz_format:(NSString *)format;

/**
 *  根据格式把NSDate转换为年，如：2016
 *
 *  @return 格式化字符串
 */
- (NSString *)kz_formatYear;

/**
 *  根据格式把NSDate转换为年月，如：2016-06
 *
 *  @return 格式化字符串
 */
- (NSString *)kz_formatYearMonth;

/**
 *  根据格式把NSDate转换为年月日，如：2016-06-26
 *
 *  @return 格式化字符串
 */
- (NSString *)kz_formatYearMonthDay;

/**
 *  根据格式把NSDate转换为年月日，如：2016年6月26日
 *
 *  @return 格式化字符串
 */
- (NSString *)kz_formatYearMonthDayChinese;

/**
 *  根据格式把NSDate转换为年月日时，如：2016-06-26 14:05
 *
 *  @return 格式化字符串
 */
- (NSString *)kz_formatYearMonthDayHourMinute;


/**
 根据格式把NSDate转换为年月日，如：2016.06.26
 
 @return 格式化字符串
 */
- (NSString *)kz_formatYearMonthDayDot_kz;

#pragma mark - 求天数
/**
 *  明天
 */
- (NSDate *)kz_tomorrow;

/**
 *  昨天
 */
- (NSDate *)kz_yesterday;

/**
 *  未来第几天
 */
- (NSDate *)kz_futureDay:(NSInteger)days;

/**
 *  过去第几天
 */
- (NSDate *)kz_pastDay:(NSInteger)days;

#pragma mark - 创建

/**
 根据格式和日期字符串转为NSDate
 
 @param format 格式
 @param dateString 日期字符串
 @return NSDate对象
 */
+ (NSDate *)kz_createDateWithFormat:(NSString *)format dateString:(NSString *)dateString;


/**
 将2016.06.26这种格式转为NSDate
 
 @param dateString 日期字符串
 @return NSDate对象
 */
+ (NSDate *)kz_createDateWithFormatYearMonthDayDotString:(NSString *)dateString;

/**
 将2016-06-26这种格式转为NSDate
 
 @param dateString 日期字符串
 @return NSDate对象
 */
+ (NSDate *)kz_createDateWithFormatYearMonthDayLineString:(NSString *)dateString;

/**
 *  将2016年6月26日这种格式转为NSDate
 *
 *  @return NSDate对象
 */
+ (NSDate *)kz_createDateWithFormatYearMonthDayChineseString:(NSString *)dateString;

#pragma mark - 比较日期
/**
 *  比较年月日
 */
- (BOOL)kz_equalToDateForYearMonthDay:(NSDate *)otherDate;

#pragma mark - 获取特殊日期

/**
 获取星期几
 
 @return 星期几字符串
 */
- (NSString *)kz_weakDay;


/**
 获取一年第几周
 
 @return 第几周
 */
- (NSInteger)kz_weakOfYear;

#pragma mark - 日期描述

/**
 距离当前的时间间隔描述
 
 @return 描述
 */
- (NSString *)kz_timeIntervalDescription;
@end
