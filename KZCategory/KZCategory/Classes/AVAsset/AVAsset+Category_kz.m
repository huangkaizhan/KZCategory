//
//  AVAsset+Category_kz.m
//  Category
//
//  Created by huangkaizhan on 2017/3/16.
//  Copyright © 2017年 baikailebeishui.cn. All rights reserved.
//

#import "CategoryHeader_kz.h"
#import "AVAsset+Category_kz.h"

@implementation AVAsset (Category_kz)

- (UIImage *)kz_getCoverImage
{
    AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:self];
    
    gen.appliesPreferredTrackTransform = YES;//按正确方向对视频进行截图,关键点是将AVAssetImageGrnerator对象的appliesPreferredTrackTransform属性设置为YES。
    
    float fps = [[self tracksWithMediaType:AVMediaTypeVideo].lastObject nominalFrameRate];
    CMTime time = CMTimeMakeWithSeconds(0.0, fps);
    
    NSError *error = nil;
    
    CMTime actualTime;
    
    CGImageRef image = [gen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    
    UIImage *thumb = [[UIImage alloc] initWithCGImage:image];
    
    CGImageRelease(image);
    
    return thumb;
}

+ (instancetype)kz_assetWithURLSafe:(NSURL *)URL
{
    if (URL && [URL isKindOfClass:[NSURL class]]) {
        return [self kz_assetWithURLSafe:URL];
    } else {
        #warning <#message#>
        return nil;
    }
}
@end
