//
//  UILabel+TextSize.m
//  YAHeadImageTableViewDemo
//
//  Created by HaKim on 17/4/1.
//  Copyright © 2017年 yinyao. All rights reserved.
//

#import "UILabel+TextSize.h"

@implementation UILabel (TextSize)

#pragma mark - tools
/// 调整行间距
- (NSMutableAttributedString *)getAttributedStringWithString:(NSString *)string lineSpace:(CGFloat)lineSpace {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpace; // 调整行间距
    NSRange range = NSMakeRange(0, [string length]);
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    return attributedString;
}

///获取字体的size
- (CGSize)contentString:(NSString *)str resizeWithFont:(UIFont *)font lineSpace:(CGFloat)lineSpace adjustSize:(CGSize)size {
    //注意：这里的字体要和控件的字体保持一致
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    attrs[NSParagraphStyleAttributeName] = paragraphStyle;
    //处理有换行时的宽，
    NSString *text = str;
    if (size.width > 10000) {
        NSArray *texts = [text componentsSeparatedByString:@"\r\n"];
        if (texts.count == 1) {
            texts = [text componentsSeparatedByString:@"\r"];
        }
        if (texts.count == 1) {
            texts = [text componentsSeparatedByString:@"\n"];
        }
        if (texts.count == 1) {
            texts = [text componentsSeparatedByString:@"\f"];
        }
        if (texts.count>0) {
            text = texts[0];
            for (int i=1; i<texts.count; i++) {
                NSString *str = [texts objectAtIndex:i];
                if (str.length>text.length) {
                    text = str;
                }
            }
        }
    }
    CGRect reFrame = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil];
    return reFrame.size;
}

@end
