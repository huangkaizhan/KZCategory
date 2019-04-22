
#import "CategoryHeader_kz.h"
#import "UIImage+Category_kz.h"

@implementation UIImage (Category_kz)

+ (UIImage *)imageTempWithBundleName_kz:(NSString *)bundleName imageName:(NSString *)imageName
{
    NSString *path = [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"];
    path = [path stringByAppendingPathComponent:imageName];
    return [self imageWithContentsOfFile:path];
}

+ (UIImage *)imageCacheWithBundleName_kz:(NSString *)bundleName imageName:(NSString *)imageName
{
    NSString *path = [NSString stringWithFormat:@"%@.bundle/%@",bundleName,imageName];
    return [self imageNamed:path];
}

+ (UIImage *)imageNamedSafe_kz:(NSString *)name
{
    if ([name isKindOfClass:[NSString class]] && name) {
        return [self imageNamed:name];
    } else {
#warning <#message#>
        return [UIImage new];
    }
}

// 拉伸图片，以中间开始拉伸
+ (UIImage *)resizedImage_kz:(NSString *)imgName
{
    return [self resizedImage_kz:imgName xPos:0.5 yPos:0.5];
}

// 拉伸图片，根据xy拉伸
+ (UIImage *)resizedImage_kz:(NSString *)imgName xPos:(CGFloat)xPos yPos:(CGFloat)yPos
{
    UIImage *image = [UIImage imageNamed:imgName];
    CGFloat width = image.size.width * xPos;
    return [image stretchableImageWithLeftCapWidth:width topCapHeight:image.size.height * yPos];
}

// 图片保存到磁盘
- (void)saveToDiskWithPath_kz:(NSString *)path
{
    NSData *imageData = UIImageJPEGRepresentation(self, 1);
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        [imageData writeToFile:path atomically:YES];
    }else
    {
        [fileManager createFileAtPath:path contents:imageData attributes:nil];
    }
}

// 高斯模糊
- (UIImage *)gaussianBlurImage_kz 
{
    // 压缩图片尺寸
    UIImage *image = [self imageScaledToMaxSize_kz:20];
    
    // 创建CIContext对象
    CIContext * context = [CIContext contextWithOptions:nil];
    
    // 获取图片
    CIImage * image1 = [CIImage imageWithCGImage:[image CGImage]];
    
    // 创建CIFilter
    CIFilter * gaussianBlur = [CIFilter filterWithName:@"CIGaussianBlur"];
    
    // 设置滤镜输入参数
    [gaussianBlur setValue:image1 forKey:@"inputImage"];
    
    // 设置模糊参数
    [gaussianBlur setValue:[NSNumber numberWithFloat:1.0]forKey:@"inputRadius"];
    
    // 得到处理后的图片
    CIImage* resultImage = [gaussianBlur valueForKey:@"outputImage"];
    
    CGImageRef imageRef = [context createCGImage:resultImage fromRect:CGRectMake(0,0,image.size.width,image.size.height)];
    
    UIImage * imge = [[UIImage alloc]initWithCGImage:imageRef];
    CFRelease(imageRef);
    return imge;
}

// 压缩图片尺寸
- (UIImage *)imageScaledToMaxSize_kz:(CGFloat)maxSize
{
    CGFloat newImageWidth;
    CGFloat newImageHeight;
    if (self.size.width > self.size.height) {
        newImageWidth = maxSize;
        newImageHeight = newImageWidth / self.size.width * self.size.height;
    }else {
        newImageHeight = maxSize;
        newImageWidth = newImageHeight / self.size.height * self.size.width;
    }
    CGSize newSize = CGSizeMake(newImageWidth, newImageHeight);
    
    // Create a graphics image context
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 1.0);
    // new size
    [self drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    // Return the new image.
    return newImage;
}

// 加水印
- (UIImage*)imageWaterMarkWithString_kz:(NSString*)str rect:(CGRect)strRect attribute:(NSDictionary *)attri image:(UIImage *)image imageRect:(CGRect)imgRect alpha:(CGFloat)alpha
{
    UIGraphicsBeginImageContext(self.size);
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0) {
        UIGraphicsBeginImageContextWithOptions(self.size, NO, 1);
    }else
    {
        UIGraphicsBeginImageContext(self.size);
    }
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height) blendMode:kCGBlendModeNormal alpha:1.0];
    if (image) {
        [image drawInRect:imgRect blendMode:kCGBlendModeNormal alpha:alpha];
    }
    
    if (str) {
        [str drawInRect:strRect withAttributes:attri];
    }
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}

// 根据缩放的宽度返回图片缩放的高度
- (CGFloat)resizeImageHeightWithWidth_kz:(CGFloat)scaleWidth
{
    CGFloat imageHeight = self.size.height;
    CGFloat factor = imageHeight / self.size.width;
    imageHeight = scaleWidth * factor;
    return imageHeight;
}


// 剪切图片为正方形
- (UIImage *)squareImageToSize_kz:(CGFloat)newSize
{
    CGAffineTransform scaleTransform;
    CGPoint origin;
    
    if (self.size.width > self.size.height) {
        //image原始高度为200，缩放image的高度为400pixels，所以缩放比率为2
        CGFloat scaleRatio = newSize / self.size.height;
        scaleTransform = CGAffineTransformMakeScale(scaleRatio, scaleRatio);
        //设置绘制原始图片的画笔坐标为CGPoint(-100, 0)pixels
        origin = CGPointMake(-(self.size.width - self.size.height) / 2.0f, 0);
    } else {
        CGFloat scaleRatio = newSize / self.size.width;
        scaleTransform = CGAffineTransformMakeScale(scaleRatio, scaleRatio);
        
        origin = CGPointMake(0, -(self.size.height - self.size.width) / 2.0f);
    }
    
    CGSize size = CGSizeMake(newSize, newSize);
    //创建画板为(400x400)pixels
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    } else {
        UIGraphicsBeginImageContext(size);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    //将image原始图片(400x200)pixels缩放为(800x400)pixels
    CGContextConcatCTM(context, scaleTransform);
    //origin也会从原始(-100, 0)缩放到(-200, 0)
    [self drawAtPoint:origin];
    
    //获取缩放后剪切的image图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

//根据图片获取图片的主色调
+ (UIColor *)mostColor_kz:(UIImage*)image
{
    int bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast;
    //第一步 先把图片缩小 加快计算速度. 但越小结果误差可能越大
    CGSize thumbSize=CGSizeMake(image.size.width/2, image.size.height/2);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 thumbSize.width,
                                                 thumbSize.height,
                                                 8,//bits per component
                                                 thumbSize.width*4,
                                                 colorSpace,
                                                 bitmapInfo);
    
    CGRect drawRect = CGRectMake(0, 0, thumbSize.width, thumbSize.height);
    CGContextDrawImage(context, drawRect, image.CGImage);
    CGColorSpaceRelease(colorSpace);
    
    //第二步 取每个点的像素值
    unsigned char* data = CGBitmapContextGetData (context);
    if (data == NULL)
    {
        CGContextRelease(context);
        return nil;
    }
    NSCountedSet *cls=[NSCountedSet setWithCapacity:thumbSize.width*thumbSize.height];
    
    for (int x=0; x<thumbSize.width; x++) {
        for (int y=0; y<thumbSize.height; y++) {
            int offset = 4*(x*y);
            int red = data[offset];
            int green = data[offset+1];
            int blue = data[offset+2];
            int alpha =  data[offset+3];
            if (alpha>0) {//去除透明
                if (red==255&&green==255&&blue==255) {//去除白色
                }else{
                    NSArray *clr=@[@(red),@(green),@(blue),@(alpha)];
                    [cls addObject:clr];
                }
                
            }
        }
    }
    CGContextRelease(context);
    //第三步 找到出现次数最多的那个颜色
    NSEnumerator *enumerator = [cls objectEnumerator];
    NSArray *curColor = nil;
    NSArray *MaxColor=nil;
    NSUInteger MaxCount=0;
    while ( (curColor = [enumerator nextObject]) != nil )
    {
        NSUInteger tmpCount = [cls countForObject:curColor];
        if ( tmpCount < MaxCount ) continue;
        MaxCount=tmpCount;
        MaxColor=curColor;
        
    }
    return [UIColor colorWithRed:([MaxColor[0] intValue]/255.0f) green:([MaxColor[1] intValue]/255.0f) blue:([MaxColor[2] intValue]/255.0f) alpha:([MaxColor[3] intValue]/255.0f)];
}

// 判断图片主色调是否是这种颜色
+ (BOOL)copareMostColorWithRed_kz:(CGFloat)red green:(CGFloat)greed blue:(CGFloat)blue fromImage:(UIImage *)image
{
    int bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast;
    //第一步 先把图片缩小 加快计算速度. 但越小结果误差可能越大
    CGSize thumbSize=CGSizeMake(image.size.width/2, image.size.height/2);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 thumbSize.width,
                                                 thumbSize.height,
                                                 8,//bits per component
                                                 thumbSize.width*4,
                                                 colorSpace,
                                                 bitmapInfo);
    
    CGRect drawRect = CGRectMake(0, 0, thumbSize.width, thumbSize.height);
    CGContextDrawImage(context, drawRect, image.CGImage);
    CGColorSpaceRelease(colorSpace);
    
    //第二步 取每个点的像素值
    unsigned char* data = CGBitmapContextGetData (context);
    if (data == NULL) {
        CGContextRelease(context);
        return NO;
    }
    NSCountedSet *cls=[NSCountedSet setWithCapacity:thumbSize.width*thumbSize.height];
    
    for (int x=0; x<thumbSize.width; x++) {
        for (int y=0; y<thumbSize.height; y++) {
            int offset = 4*(x*y);
            int red = data[offset];
            int green = data[offset+1];
            int blue = data[offset+2];
            int alpha =  data[offset+3];
            if (alpha>0) {
                NSArray *clr=@[@(red),@(green),@(blue),@(alpha)];
                [cls addObject:clr];
            }
        }
    }
    CGContextRelease(context);
    //第三步 找到出现次数最多的那个颜色
    NSEnumerator *enumerator = [cls objectEnumerator];
    NSArray *curColor = nil;
    NSArray *MaxColor=nil;
    NSUInteger MaxCount=0;
    while ( (curColor = [enumerator nextObject]) != nil )
    {
        NSUInteger tmpCount = [cls countForObject:curColor];
        if ( tmpCount < MaxCount ) continue;
        MaxCount=tmpCount;
        MaxColor=curColor;
        
    }
    if ([MaxColor.firstObject floatValue] > red && [MaxColor[1] floatValue] > greed && [MaxColor[2] floatValue] > blue) {
        return YES;
    } else {
        return NO;
    }
}
@end
