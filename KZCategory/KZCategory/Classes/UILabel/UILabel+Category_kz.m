//
//  UILabel+Category_kz.m
//  Category
//
//  Created by huangkaizhan on 2017/5/15.
//  Copyright © 2017年 baikailebeishui.cn. All rights reserved.
//

#import "UILabel+Category_kz.h"

@implementation UILabel (Category_kz)

/**
 设置内容，间距默认为10
 
 @param text 内容
 */
- (void)setContentAttributedText:(NSString *)text
{
    [self setContentAttributedText:text margin:10];
}

/**
 设置内容
 
 @param text 内容
 @param margin 间距
 */
- (void)setContentAttributedText:(NSString *)text margin:(CGFloat)margin
{
    NSUInteger textLength = text.length;
    NSString *textString = text;
    if (!textString.length) {
        textString = @"";
    }
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:textString];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [attributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, textLength)];
    [paragraphStyle setLineSpacing:margin];
    self.attributedText = attributeString;
}
@end
