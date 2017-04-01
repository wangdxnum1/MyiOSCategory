//
//  UILabel+TextSize.h
//  YAHeadImageTableViewDemo
//
//  Created by HaKim on 17/4/1.
//  Copyright © 2017年 yinyao. All rights reserved.
//

#import <UIKit/UIKit.h>

// 计算UILabel的文字size，高度，宽度

@interface UILabel (TextSize)

- (NSMutableAttributedString *)getAttributedStringWithString:(NSString *)string lineSpace:(CGFloat)lineSpace ;

- (CGSize)contentString:(NSString *)str resizeWithFont:(UIFont *)font lineSpace:(CGFloat)lineSpace adjustSize:(CGSize)size;

@end
