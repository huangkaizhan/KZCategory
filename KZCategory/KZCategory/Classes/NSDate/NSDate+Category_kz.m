//
//  NSDate+Category_kz.m
//  Category
//
//  Created by huangkaizhan on 2016/12/5.
//  Copyright © 2016年 baikailebeishui.cn. All rights reserved.
//

#import "NSDate+Category_kz.h"

#define DateMinute_kz       60          // 一分60秒
#define DateHour_kz         3600        // 一小时3600秒
#define DateDay_kz          86400       // 一天86400秒
#define DateWeek_kz         604800      // 一周604800秒
#define Date_ear_kz         31556926    // 一年31556926秒（不准确）

@implementation NSDate (Category_kz)

#pragma mark - 格式化
// 根据格式转换
- (NSString *)kz_format:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *text = [dateFormatter stringFromDate:self];
    return text;
}

// 根据格式把NSDate转换为年，如：2016
- (NSString *)kz_formatYear
{
    return [self kz_format:DateFormatYear];
}

// 根据格式把NSDate转换为年月，如：2016-06
- (NSString *)kz_formatYearMonth
{
    return [self kz_format:DateFormatMonth];
}

// 根据格式把NSDate转换为年月日，如：2016-06-26
- (NSString *)kz_formatYearMonthDay
{
    return [self kz_format:DateFormatDay];
}

// 根据格式把NSDate转换为年月日，如：2016年06月26日
- (NSString *)kz_formatYearMonthDayChinese
{
    return [self kz_format:DateFormatDayChinese];
}

// 根据格式把NSDate转换为年月日时，如：2016-06-26 14:05
- (NSString *)kz_formatYearMonthDayHourMinute
{
    return [self kz_format:DateFormatMinute];
}

// 根据格式把NSDate转换为年月日，如：2016.06.26
- (NSString *)kz_formatYearMonthDayDot_kz
{
    return [self kz_format:DateFormatDayDot];
}

#pragma mark - 求天数
// 明天
- (NSDate *)kz_tomorrow
{
    return [self dateByAddingTimeInterval:1];
}

// 昨天
- (NSDate *)kz_yesterday
{
    return [self dateByAddingTimeInterval:-1];
}

// 未来第几天
- (NSDate *)kz_futureDay:(NSInteger)days
{
    return [self dateByAddingTimeInterval:days];
}

// 过去第几天
- (NSDate *)kz_pastDay:(NSInteger)days
{
    return [self dateByAddingTimeInterval:-days];
}

// 更改天数
- (NSDate *)kz_dateByAddingDays:(NSInteger)days
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + DateDay_kz * days;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

#pragma mark - 创建
// 根据格式和日期字符串转为NSDate
+ (NSDate *)kz_createDateWithFormat:(NSString *)format dateString:(NSString *)dateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSDate *date = [dateFormatter dateFromString:dateString];
    return date;
}

// 将2016.06.26这种格式转为NSDate
+ (NSDate *)kz_createDateWithFormatYearMonthDayDotString:(NSString *)dateString
{
    return [self kz_createDateWithFormat:DateFormatDayDot dateString:dateString];
}

// 将2016-06-26这种格式转为NSDate
+ (NSDate *)kz_createDateWithFormatYearMonthDayLineString:(NSString *)dateString
{
    return [self kz_createDateWithFormat:DateFormatDay dateString:dateString];
}

// 将2016年6月26日这种格式转为NSDate
+ (NSDate *)kz_createDateWithFormatYearMonthDayChineseString:(NSString *)dateString
{
    return [self kz_createDateWithFormat:DateFormatDayChinese dateString:dateString];
}

#pragma mark - 比较日期
// 比较年月日
- (BOOL)kz_equalToDateForYearMonthDay:(NSDate *)otherDate
{
    unsigned unitFlag = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSCalendar *calenda = [NSCalendar currentCalendar];
    NSDateComponents *comps1 = [calenda components:unitFlag fromDate:self];
    NSDateComponents *comps2 = [calenda components:unitFlag fromDate:otherDate];
    return (comps1.day == comps2.day) && (comps1.month == comps2.month) && (comps1.year == comps2.year);
}

#pragma mark - 获取特殊日期

// 获取星期几
- (NSString *)kz_weakDay
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSInteger unitFlags = NSCalendarUnitWeekOfMonth|NSCalendarUnitWeekday;
    
    NSDateComponents *comps = [calendar components:unitFlags fromDate:self];
    NSMutableString *weekDayString = [NSMutableString stringWithString:@"星期"];
    NSString *dayString = @"";
    switch (comps.weekday) {
            case 1:
            dayString = @"日";
            break;
            case 2:
            dayString = @"一";
            break;
            case 3:
            dayString = @"二";
            break;
            case 4:
            dayString = @"三";
            break;
            case 5:
            dayString = @"四";
            break;
            case 6:
            dayString = @"五";
            break;
            case 7:
            dayString = @"六";
            break;
        default:
            dayString = @"日";
            break;
    }
    [weekDayString appendString:dayString];
    return weekDayString;
}

// 获取一年第几周
- (NSInteger)kz_weakOfYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger unitFlags = NSCalendarUnitWeekOfYear|NSCalendarUnitWeekday;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:self];
    return comps.weekOfYear;
}

#pragma mark - 日期描述
// 距离当前的时间间隔描述
- (NSString *)kz_timeIntervalDescription
{
    NSTimeInterval timeInterval = -[self timeIntervalSinceNow];
    if (timeInterval < DateMinute_kz) {
        return @"1分钟内";
    } else if (timeInterval < DateHour_kz) {
        return [NSString stringWithFormat:@"%.f分钟前", timeInterval / DateMinute_kz];
    } else if (timeInterval < DateDay_kz) {
        return [NSString stringWithFormat:@"%.f小时前", timeInterval / DateHour_kz];
    } else if (timeInterval < 2592000) {//30天内
        return [NSString stringWithFormat:@"%.f天前", timeInterval / DateDay_kz];
    } else {
        return [self kz_formatYearMonthDayDot_kz];
    }
}
@end
