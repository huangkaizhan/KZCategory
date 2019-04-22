//
//  BBCategoryHeader.h
//  Category
//
//  Created by huangkaizhan on 2016/12/21.
//  Copyright © 2016年 baikailebeishui.cn. All rights reserved.
//

#ifndef CategoryHeader_kz_h
#define CategoryHeader_kz_h

#import "UIImage+Category_kz.h"
#import "NSArray+Category_kz.h"
#import "NSMutableArray+Category_kz.h"
#import "NSDictionary+Category_kz.h"
#import "NSMutableDictionary+Category_kz.h"
#import "NSObject+Category_kz.h"
#import "KZReport.h"

// 创建图片对象（使用方式为imageOfFile方式），不会加载到内存，适合用一次的图片
#define Image_From_File_kz(bundleName,imgName)                [UIImage imageTempWithBundleName_kz:(bundleName) imageName:(imgName)]

// 创建图片，使用imageNamed方式，加载到内存，适合多次应用，如下拉刷新的logo
#define Image_From_Named_kz(bundleName, imgName)              [UIImage imageCacheWithBundleName_kz:(bundleName) imageName:(imgName)]


#endif /* BBCategoryHeader_h */
