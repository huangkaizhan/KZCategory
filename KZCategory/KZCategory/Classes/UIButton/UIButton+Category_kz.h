//
//  UIButton+Category_kz.h
//  Pods
//
//  Created by huangkaizhan on 2017/7/3.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ImagePosition){
    
    ImagePositionLeft = 0,   // 图片在左
    ImagePositionRight = 1,  // 图片在右边
    ImagePositionTop = 2,    // 图片在上
    ImagePositionBottom = 3, // 图片在下
    
};

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Category_kz)


/**
 设置图片
 
 @param position 位置
 @param spacing 图片和文字间距
 */
- (void)setImagePoition:(ImagePosition)position spacing:(CGFloat)spacing;

@end

NS_ASSUME_NONNULL_END
