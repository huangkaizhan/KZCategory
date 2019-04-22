//
//  CALayer+Category_kz.h
//  MamaCategoryLib
//
//  Created by huang kaizhan on 2018/12/12.
//  Copyright © 2018年 Shengcheng. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CALayer (Category_kz)

/**
 渐变层
 */
@property (nonatomic, strong) CALayer *gradienLayer_kz;


/**
 添加水平渐变

 @param colors 颜色数组
 */
- (void)kz_addHorizontalGradienWithColors:(NSArray <UIColor *>*)colors;

/**
 添加垂直渐变
 
 @param colors 颜色数组
 */
- (void)kz_addVerticalGradienWithColors:(NSArray <UIColor *>*)colors;

@end
