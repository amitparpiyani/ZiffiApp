//
//  UILabel+TTFExtension.m
//  Ziffi
//
//  Created by Amit Parpiyani on 25/05/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import "UILabel+TTFExtension.h"

@implementation UILabel (TTFExtension)
- (void)setFilledTTFFont:(NSString *)fontText withFontSize:(float)fontSize fontColor:(UIColor *)fontColor fromRating:(NSInteger)rating
{
   // self.font = [UIFont fontWithName:@"" size:fontSize];
    [self setFont:[UIFont fontWithName:@"ziffy" size:16.0f]];

    self.textColor = fontColor;
    self.text = fontText;
    if (self.tag<=rating)
    {
        self.text = @"a";

        
    }
}

- (void)setTTFFont:(NSString *)fontText withFontSize:(float)fontSize fontColor:(UIColor *)fontColor
{
    [self setFont:[UIFont fontWithName:@"ziffy" size:16.0f]];
    
    self.textColor = fontColor;
    self.text = fontText;
    
}
@end
