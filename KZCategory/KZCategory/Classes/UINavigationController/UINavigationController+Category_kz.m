//
//  UINavigationController+Category_kz.m
//  Category
//
//  Created by huangkaizhan on 2017/2/17.
//  Copyright © 2017年 baikailebeishui.cn. All rights reserved.
//

#import "UINavigationController+Category_kz.h"

@implementation UINavigationController (Category_kz)

+ (UINavigationController *)kz_rootNavigationController {
    UIViewController *rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarVC = (UITabBarController *)rootViewController;
        UINavigationController *navigationController = (UINavigationController *)tabBarVC.selectedViewController;
        return navigationController;
    }else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        return (UINavigationController *)rootViewController;
    }else {
        return rootViewController.navigationController;
    }
}

#pragma mark - Pop
// pop到指定控制器
- (BOOL)kz_popViewControllerWithName:(NSString *)name
{
    return [self kz_popViewControllerWithClass:NSClassFromString(name)];
}

// pop到指定控制器
- (BOOL)kz_popViewControllerWithClass:(Class)vcClass
{
    BOOL isOk = NO;
    UIViewController *toVC = nil;
    for (UIViewController *vc in self.viewControllers) {
        if ([vc isKindOfClass:vcClass]) {
            toVC = vc;
            break;
        }
    }
    if (toVC) {
        [self popToViewController:toVC animated:YES];
        isOk = YES;
    }
    return isOk;
}

@end

