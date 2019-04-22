//
//  UINavigationController+Category_kz.h
//  Category
//
//  Created by huangkaizhan on 2017/2/17.
//  Copyright © 2017年 baikailebeishui.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Category_kz)


/**
 当前导航控制器
 
 @return 当前导航控制器
 */
+ (UINavigationController *)kz_rootNavigationController;



/**
 pop到指定控制器
 
 @param name 控制器名字
 */
- (BOOL)kz_popViewControllerWithName:(NSString *)name;


/**
 pop到指定控制器
 
 @param vcClass 控制器class
 */
- (BOOL)kz_popViewControllerWithClass:(Class)vcClass;

@end

