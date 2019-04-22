//
//  UITextField+Category_kz.h
//  Category
//
//  Created by huangkaizhan on 2017/6/29.
//  Copyright © 2017年 baikailebeishui.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Category_kz)

/**
 限制输入多少位小数点
 
 @param range 范围
 @param string 传入的字符串
 @param limitedIndex 限制位数
 @return  限制输入多少位小数点
 */
- (BOOL)kz_restrictCharactersInRange:(NSRange)range replacementString:(NSString *)string limitedIndex:(NSInteger)limitedIndex;

@end
