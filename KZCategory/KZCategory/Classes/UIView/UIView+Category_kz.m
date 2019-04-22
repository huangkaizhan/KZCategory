//
//  UIView+Category_kz.m
//  Category
//
//  Created by huangkaizhan on 2016/12/5.
//  Copyright © 2016年 baikailebeishui.cn. All rights reserved.
//

#import "CategoryHeader_kz.h"
#import "UIView+Category_kz.h"

@implementation UIView (Category_kz)

#pragma mark - frame
// 高度
- (CGFloat)height_kz
{
    return self.frame.size.height;
}

// 设置高度
- (void)setHeight_kz:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

// 宽度
- (CGFloat)width_kz
{
    return self.frame.size.width;
}

// 设置宽度
- (void)setWidth_kz:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

// x坐标
- (CGFloat)x_kz
{
    return self.frame.origin.x;
}

// 设置x坐标
- (void)setX_kz:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

// y坐标
- (CGFloat)y_kz
{
    return self.frame.origin.y;
}

// 设置y坐标
- (void)setY_kz:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

//设置X居中
-(void)setCenterX_kz:(CGFloat)centerX_kz
{
    CGPoint center = self.center;
    center.x = centerX_kz;
    self.center = center;
    
}

//设置Y居中
-(void)setCenterY_kz:(CGFloat)centerY_kz
{
    CGPoint center = self.center;
    center.y = centerY_kz;
    self.center = center;
}


- (CGFloat)centerY_kz
{
    return self.center.y;
}

- (CGFloat)centerX_kz
{
    return self.center.x;
}

// 计算在inView中的frame
- (CGRect)relativeFrameInView:(UIView *)inView
{
    if (!inView) {
        return CGRectZero;
    }
    CGFloat x = .0;
    CGFloat y = .0;
    UIView *view = self;
    // inView是view的祖先控件，层层上递归，等相等的时候，那么就证明找到了
    while (view != inView) {
        x += view.frame.origin.x;
        y += view.frame.origin.y;
        view = view.superview;
        if (!view) {
            break;
        }
        if ([view isKindOfClass:[UIScrollView class]]) {
            x -= ((UIScrollView *) view).contentOffset.x;
            y -= ((UIScrollView *) view).contentOffset.y;
        }
    }
    if (!view) {
        // view没找到祖先控件
        return CGRectZero;
    }
    return CGRectMake(x, y, self.frame.size.width, self.frame.size.height);
}

#pragma mark - 手势
// 添加单击手势
- (void)addTapGestureWithTarget_kz:(id)target action:(SEL)action
{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:tapGesture];
}

// 添加滑动手势
- (void)addPanGestureWithTarget_kz:(id)target action:(SEL)action
{
    self.userInteractionEnabled = YES;
    UIPanGestureRecognizer *tapGesture = [[UIPanGestureRecognizer alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:tapGesture];
}

#pragma mark - 图片
// 截图并生成UIImageView
- (UIImageView *)shotImageView_kz
{
    CGSize imageSize = self.frame.size;
    UIImage *image = [self shotImage_kz];
    
    // 创建
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = image;
    imageView.frame = CGRectMake(0, 0, imageSize.width, imageSize.height);
    return imageView;
}

// 截图
- (UIImage *)shotImage_kz
{
    return [self shotImageWithScale_kz:1.0];
}

- (UIImage *)shotImageWithScale_kz:(CGFloat)scale
{
    CGSize imgSize = self.bounds.size;
    CGSize outputSize = imgSize;
    
    CGFloat radius = atan2f(self.transform.b, self.transform.a);
    
    CGRect rect = CGRectMake(0, 0, imgSize.width, imgSize.height);
    rect = CGRectApplyAffineTransform(rect, CGAffineTransformMakeRotation(radius));
    outputSize = CGSizeMake(CGRectGetWidth(rect), CGRectGetHeight(rect));
    
    UIGraphicsBeginImageContextWithOptions(outputSize, NO,1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextTranslateCTM(context, outputSize.width / 2, outputSize.height / 2);
    CGContextRotateCTM(context, radius);
    CGContextTranslateCTM(context, -imgSize.width / 2, -imgSize.height / 2);
    //    CGFloat scale =
    CGContextScaleCTM(context, scale, scale);
    
    CGContextSaveGState(context);
    [[self layer] renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark - 控件
// 安全添加子控件
- (void)addSubviewSafe_kz:(UIView *)view
{
    if (view && [view isKindOfClass:[UIView class]]){
        if ([view isEqual:self]) {
            // 异常记录上报,不能添加自己
            #warning <#message#>
        } else {
            [self addSubview:view];
        }
    } else {
        // 异常记录上报
#warning <#message#>
    }
}
// 安全插入子控件
- (void)insertSubviewSafe_kz:(UIView *)view atIndex:(NSInteger)index
{
    if (view && [view isKindOfClass:[UIView class]]) {
        if ([view isEqual:self]) {
            // 异常记录上报,不能添加自己
#warning <#message#>
        } else {
            [self insertSubview:view atIndex:index];
        }
    } else {
        // 异常记录上报
#warning <#message#>
    }
}

// 删除所有子控件
- (void)removeAllSubviews_kz
{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

#pragma mark - layer
// 变圆
- (void)toCircle_kz
{
    CGFloat corner = self.frame.size.height * 0.5;
    [self setCorner_kz:corner];
}

// 设置圆角
- (void)setCorner_kz:(CGFloat)corner
{
    self.layer.cornerRadius = corner;
    self.clipsToBounds = YES;
    [self.layer setMasksToBounds:YES];
}
@end
