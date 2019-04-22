//
//  UIFont+Category_kz.m
//  MamaCategoryLib
//
//  Created by huang kaizhan on 2018/11/23.
//  Copyright © 2018年 Shengcheng. All rights reserved.
//

#import "UIFont+Category_kz.h"

@implementation UIFont (Category_kz)

+ (instancetype)kz_systemFontWithLightWeightOfSize:(CGFloat)fontSize
{
    UIFont *font;
    if ([self respondsToSelector:@selector(systemFontOfSize:weight:)]) {
        font = [self systemFontOfSize:fontSize weight:UIFontWeightLight];
    } else {
        font = [self systemFontOfSize:fontSize];
    }
    return font;
}

@end
