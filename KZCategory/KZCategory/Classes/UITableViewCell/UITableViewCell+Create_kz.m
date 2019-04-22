//
//  UITableViewCell+Create_kz.m
//  Category
//
//  Created by huangkaizhan on 2017/1/4.
//  Copyright © 2017年 baikailebeishui.cn. All rights reserved.
//

#import "UITableViewCell+Create_kz.h"

@implementation UITableViewCell (Create_kz)

+ (instancetype)cellWithTableView:(UITableView *)tableView class:(Class)cellClass
{
    NSString *cellName = NSStringFromClass(cellClass);
    id cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if(!cell){
        cell = [[[NSBundle mainBundle] loadNibNamed:cellName owner:nil options:nil] lastObject];
    }
    return cell;
}

+ (instancetype)cellWithInitStyleTableView:(UITableView *)tableView class:(Class)cellClass
{
    NSString *cellName = NSStringFromClass(cellClass);
    id cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if(!cell){
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    return cell;
}

@end
