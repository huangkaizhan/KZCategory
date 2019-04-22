//
//  UITableViewCell+Create_kz.h
//  Category
//
//  Created by huangkaizhan on 2017/1/4.
//  Copyright © 2017年 baikailebeishui.cn. All rights reserved.
//  UITableViewCell 创建分类

#import <UIKit/UIKit.h>

@interface UITableViewCell (Create_kz)

/**
 *  获取默认从xib加载的cell（xib为类名称，如果不存在，将会报错）
 *
 *  @param tableView cell所在的tableView
 *  @param cellClass cell的类名，将用作Identifier和xib名称
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView class:(Class)cellClass;

/**
 *  获取cell，不从xib创建，initWithStyle来创建
 *
 *  @param tableView cell所在的tableView
 *  @param cellClass cell的类名，将用作Identifier
 */
+ (instancetype)cellWithInitStyleTableView:(UITableView *)tableView class:(Class)cellClass;

@end
