//
//  UIColor+Category_kz.h
//  Category
//
//  Created by huangkaizhan on 2017/8/4.
//  Copyright © 2017年 baikailebeishui.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Category_kz)

// 颜色转换：iOS中（以#开头）十六进制的颜色转换为UIColor(RGB)
+ (UIColor *)kz_colorWithHexString:(NSString *)color;


/**
 跟其它颜色相比较
 
 @param color 其它颜色
 @return 是否相等
 */
- (BOOL)kz_isEqualOtherColor:(UIColor *)color;
@end
