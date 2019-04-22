//
//  AVAsset+Category_kz.h
//  Category
//
//  Created by huangkaizhan on 2017/3/16.
//  Copyright © 2017年 baikailebeishui.cn. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

@interface AVAsset (Category_kz)

/**
 获取封面图
 
 @return 封面图
 */
- (UIImage *)kz_getCoverImage;


/**
 安全初始化asset
 
 @param URL 资源路径
 @return asset
 */
+ (instancetype)kz_assetWithURLSafe:(NSURL *)URL;
@end
