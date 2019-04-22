//
//  NSURL+Category_kz.h
//  Category
//
//  Created by huang kaizhan on 2018/11/17.
//  Copyright © 2018年 baikailebeishui.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (Category_kz)

+ (instancetype)kz_URLWithString:(NSString *)URLString;

+ (instancetype)kz_URLWithString:(NSString *)URLString relativeToURL:(NSURL *)baseURL;

+ (NSURL *)kz_fileURLWithPath:(NSString *)path;
@end
