//
//  NSURL+Category_kz.m
//  Category
//
//  Created by huang kaizhan on 2018/11/17.
//  Copyright © 2018年 baikailebeishui.cn. All rights reserved.
//

#import "CategoryHeader_kz.h"
#import "NSURL+Category_kz.h"

@implementation NSURL (Category_kz)

+ (instancetype)kz_URLWithString:(NSString *)URLString
{
    if ([URLString isKindOfClass:[NSString class]] && URLString) {
        return [self URLWithString:URLString];
    } else {
        #warning <#message#>
        return [self URLWithString:@""];
    }
}

+ (instancetype)kz_URLWithString:(NSString *)URLString relativeToURL:(NSURL *)baseURL
{
    if ([URLString isKindOfClass:[NSString class]] && URLString) {
        return [self URLWithString:URLString relativeToURL:baseURL];
    } else {
        #warning <#message#>
        return [self URLWithString:@"" relativeToURL:baseURL];
    }
}

+ (NSURL *)kz_fileURLWithPath:(NSString *)path
{
    if ([path isKindOfClass:[NSString class]] && path) {
        return [self fileURLWithPath:path];
    } else {
        #warning <#message#>
        return [self fileURLWithPath:@""];
    }
}

@end
