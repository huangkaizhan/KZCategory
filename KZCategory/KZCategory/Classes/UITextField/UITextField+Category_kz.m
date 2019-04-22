//
//  UITextField+Category_kz.m
//  Category
//
//  Created by huangkaizhan on 2017/6/29.
//  Copyright © 2017年 baikailebeishui.cn. All rights reserved.
//

#import "UITextField+Category_kz.h"

@implementation UITextField (Category_kz)

- (BOOL)kz_restrictCharactersInRange:(NSRange)range replacementString:(NSString *)string limitedIndex:(NSInteger)limitedIndex
{
    if(((string.intValue<0) || (string.intValue>9))){
        if ((![string isEqualToString:@"."])) {
            return NO;
        }
        return NO;
    }
    
    NSMutableString * futureString = [NSMutableString stringWithString:self.text];
    [futureString  insertString:string atIndex:range.location];
    
    NSInteger dotNum = 0;
    NSInteger flag=0;
    if((int)futureString.length>=1){
        
        if([futureString characterAtIndex:0] == '.'){
            return NO;
        }
        if((int)futureString.length>=2){
            if(([futureString characterAtIndex:1] != '.'&&[futureString characterAtIndex:0] == '0')){
                return NO;
            }
        }
    }
    NSInteger dotAfter = 0;
    for (int i = (int)futureString.length-1; i>=0; i--) {
        if ([futureString characterAtIndex:i] == '.') {
            dotNum ++;
            dotAfter = flag+1;
            if (flag > limitedIndex) {
                return NO;
            }
            if(dotNum>1){
                return NO;
            }
        }
        flag++;
    }
    if(futureString.length - dotAfter > 7){
        return NO;
    }
    return YES;
    

}


@end
