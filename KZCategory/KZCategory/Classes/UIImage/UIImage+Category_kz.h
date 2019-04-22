//
//  UIImage+Category_kz.h
//  Category
//
//  Created by huangkaizhan on 2016/12/5.
//  Copyright © 2016年 baikailebeishui.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category_kz)

/**
 *  创建图片，使用file方式，不会加载到内存，适合一次性用
 *
 *  @param bundleName   bundle名字，不用加后缀
 *  @param imageName    图片名字
 *
 *  @return 图片对象
 */
+ (UIImage *)imageTempWithBundleName_kz:(NSString *)bundleName imageName:(NSString *)imageName;


/**
 *  创建图片，使用imageNamed方式，加载到内存，适合多次应用，如下拉刷新的logo
 *
 *  @param bundleName   bundle名字，不用加后缀
 *  @param imageName    图片名字
 *
 *  @return 图片对象
 */
+ (UIImage *)imageCacheWithBundleName_kz:(NSString *)bundleName imageName:(NSString *)imageName;


/**
 创建图片
 
 @param name 图片
 @return UIImage
 */
+ (UIImage *)imageNamedSafe_kz:(NSString *)name;

/**
 *  拉伸图片，以中间开始拉伸
 *
 *  @param imgName 图片名称
 *
 *  @return 图片对象
 */
+ (UIImage *)resizedImage_kz:(NSString *)imgName;



/**
 *  拉伸图片
 *
 *  @param imgName 图片名称
 *  @param xPos    从x坐标处开始拉伸
 *  @param yPos    从y坐标处开始拉伸
 *
 *  @return 图片对象
 */
+ (UIImage *)resizedImage_kz:(NSString *)imgName xPos:(CGFloat)xPos yPos:(CGFloat)yPos;


/**
 压缩图片尺寸
 
 @param maxSize 最大宽度
 @return 压缩后的图片
 */
- (UIImage *)imageScaledToMaxSize_kz:(CGFloat)maxSize;

/**
 *  图片保存到磁盘
 *
 *  @param path  图片路径
 */
- (void)saveToDiskWithPath_kz:(NSString *)path;

/**
 *  高斯模糊
 *
 *  @return 高斯模糊后的图片
 */
- (UIImage *)gaussianBlurImage_kz;

/**
 *  加水印（贴纸）
 *
 *  @param str     水印字符窜
 *  @param strRect 字符的rect
 *  @param attri   富文本属性
 *  @param image   图片
 *  @param imgRect 水印图片位置
 *  @param alpha   透明度
 *
 *  @return 合成之后的图片
 */
- (UIImage*)imageWaterMarkWithString_kz:(NSString*)str rect:(CGRect)strRect attribute:(NSDictionary *)attri image:(UIImage *)image imageRect:(CGRect)imgRect alpha:(CGFloat)alpha;


/**
 根据缩放的宽度返回图片缩放的高度
 
 @param scaleWidth 缩放的宽度
 @return 缩放的高度
 */
- (CGFloat)resizeImageHeightWithWidth_kz:(CGFloat)scaleWidth;

/**
 *  剪切图片为正方形
 *
 *  @param newSize 正方形的size比如400pixels
 *
 *  @return 返回正方形图片(400x400)pixels
 */
- (UIImage *)squareImageToSize_kz:(CGFloat)newSize;


/**
 根据图片获取主色调
 
 @param image 图片
 @return 主色调
 */
+ (UIColor *)mostColor_kz:(UIImage*)image;


/**
 判断图片主色调是否是这种颜色
 
 @param red 红
 @param greed 绿
 @param blue 蓝
 @param image 获取图片
 @return 比较结果，比如是否偏白色
 */
+ (BOOL)copareMostColorWithRed_kz:(CGFloat)red green:(CGFloat)greed blue:(CGFloat)blue fromImage:(UIImage *)image;
@end
