//
//  UILabel+Category_kz.h
//  Category
//
//  Created by huangkaizhan on 2017/5/15.
//  Copyright © 2017年 baikailebeishui.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Category_kz)


/**
 设置内容，间距默认为10

 @param text 内容
 */
- (void)setContentAttributedText:(NSString *)text;


/**
 设置内容

 @param text 内容
 @param margin 间距
 */
- (void)setContentAttributedText:(NSString *)text margin:(CGFloat)margin;
@end
