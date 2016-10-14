//
//  XDAttributedText.m
//  gasstation
//
//  Created by inspiry on 16/4/1.
//  Copyright © 2016年 inspiry. All rights reserved.
//

#import "XDAttributedText.h"
#import <UIKit/UIKit.h>

@implementation XDAttributedText

+ (NSMutableAttributedString *)setupOneAttributedText:(NSString *)text array:(NSArray *)array
{
    NSMutableAttributedString *attrubuteString = [[NSMutableAttributedString alloc] initWithString:text];
    [attrubuteString addAttribute:NSForegroundColorAttributeName value:array[0] range:NSMakeRange(0, text.length)];
    [attrubuteString addAttribute:NSFontAttributeName value:array[1] range:NSMakeRange(0, text.length)];
    return attrubuteString;
}

+ (NSMutableAttributedString *)setupTrendsAttributedText:(NSString *)text startArray:(NSArray *)startArray centreArray:(NSArray *)centreArray endArray:(NSArray *)endArray
{
    NSMutableAttributedString *attrubuteString = [[NSMutableAttributedString alloc] initWithString:text];
    
    NSInteger startLength = [startArray[0] integerValue];
    NSInteger centreLength = [centreArray[0] integerValue];
    NSInteger endLength = [endArray[0] integerValue];
    
    if (startLength > text.length || centreLength > text.length || endLength > text.length || startLength + centreLength > text.length || endLength + centreLength > text.length ||startLength + endLength > text.length) return attrubuteString;
    if (centreArray && ((!startLength && !centreLength) || (!centreLength && !endLength)|| (!endLength && !startLength))) return attrubuteString;

    NSRange startRange;
    NSRange centreRange;
    NSRange endRange;
    
    startRange = NSMakeRange(0, startLength ? startLength : text.length - centreLength - endLength);
    centreRange = centreArray ? NSMakeRange(startLength ? startLength : text.length - centreLength - endLength ,centreLength ? centreLength : text.length - startLength - endLength) : NSMakeRange(0, 0);
    endRange = NSMakeRange(endLength ? text.length - endLength : startLength + centreLength, endLength? endLength : text.length - startLength - centreLength);
        
    [attrubuteString addAttribute:NSForegroundColorAttributeName value:startArray[1] range:startRange];
    [attrubuteString addAttribute:NSForegroundColorAttributeName value:centreArray[1] range:centreRange];
    [attrubuteString addAttribute:NSForegroundColorAttributeName value:endArray[1] range:endRange];
    
    [attrubuteString addAttribute:NSFontAttributeName value:startArray[2] range:startRange];
    [attrubuteString addAttribute:NSFontAttributeName value:centreArray[2] range:centreRange];
    [attrubuteString addAttribute:NSFontAttributeName value:endArray[2] range:endRange];
    
    return attrubuteString;
}

+ (NSMutableAttributedString *)setupMoreAttributedText:(NSString *)text arrays:(id)firstObj, ...
{
    NSMutableAttributedString *attrubuteString = [[NSMutableAttributedString alloc] initWithString:text];

    NSMutableArray *argsArray = [[NSMutableArray alloc] init];
    va_list params;
    va_start(params,firstObj);
    id arg;
    if (firstObj) {
        [argsArray addObject:firstObj];
        while((arg = va_arg(params,id))) {
            if (arg){
                [argsArray addObject:arg];
            }
        }
        va_end(params);
        
        for (NSInteger i = 0; i < argsArray.count; i ++) {
            
            NSInteger num = 0;
            NSInteger loc = 0;
            while (num < i) {
                loc += [argsArray[num][0] integerValue];
                num ++;
            }
            [attrubuteString addAttribute:NSForegroundColorAttributeName value:argsArray[i][1] range:NSMakeRange(loc, [argsArray[i][0] integerValue])];
            [attrubuteString addAttribute:NSFontAttributeName value:argsArray[i][2] range:NSMakeRange(loc, [argsArray[i][0] integerValue])];
        }
    }
    return attrubuteString;
}
@end
