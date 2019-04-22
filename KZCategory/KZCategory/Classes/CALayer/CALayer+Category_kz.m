//
//  CALayer+Category_kz.m
//  MamaCategoryLib
//
//  Created by huang kaizhan on 2018/12/12.
//  Copyright © 2018年 Shengcheng. All rights reserved.
//

#import "CALayer+Category_kz.h"
#import "objc/runtime.h"

static const void *kGradienLayerKey = &kGradienLayerKey;

@implementation CALayer (Category_kz)

- (void)setGradienLayer_kz:(CALayer *)gradienLayer_kz 
{
    objc_setAssociatedObject(self, kGradienLayerKey, gradienLayer_kz , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CALayer *)gradienLayer_kz 
{
    return objc_getAssociatedObject(self, kGradienLayerKey);
}

- (void)kz_addHorizontalGradienWithColors:(NSArray<UIColor *> *)colors
{
    [self.gradienLayer_kz removeFromSuperlayer];
    CAGradientLayer *gradienLayer = [CAGradientLayer layer];
    gradienLayer.frame = self.frame;
    gradienLayer.colors = colors;
    gradienLayer.startPoint = CGPointZero;
    gradienLayer.endPoint = CGPointMake(1, 0);
    [self addSublayer:gradienLayer];
}

- (void)kz_addVerticalGradienWithColors:(NSArray<UIColor *> *)colors
{
    [self.gradienLayer_kz removeFromSuperlayer];
    CAGradientLayer *gradienLayer = [CAGradientLayer layer];
    gradienLayer.frame = self.frame;
    gradienLayer.colors = colors;
    gradienLayer.startPoint = CGPointZero;
    gradienLayer.endPoint = CGPointMake(0, 1);
    [self addSublayer:gradienLayer];
}

@end
