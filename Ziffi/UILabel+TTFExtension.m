//
//  UILabel+TTFExtension.m
//  Ziffi
//
//  Created by Amit Parpiyani on 25/05/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import "UILabel+TTFExtension.h"
#import "Constants.h"

@implementation UILabel (TTFExtension)
- (void)setFilledTTFFont:(NSString *)fontText withFontSize:(float)fontSize fontColor:(UIColor *)fontColor fromRating:(NSInteger)rating
{
   // self.font = [UIFont fontWithName:@"" size:fontSize];
    [self setFont:[UIFont fontWithName:@"ziffy" size:16.0f]];

    self.textColor = fontColor;
    self.text = fontText;
    if (rating>self.tag)
    {
        self.text = FULL_STAR_FONT_VALUE;

        
    }
    else if (rating<=self.tag && rating+0.5 >= self.tag )
    {
        self.text = HALF_STAR_FONT_VALUE;
    }
}

- (void)setTTFFont:(NSString *)fontText withFontSize:(float)fontSize fontColor:(UIColor *)fontColor
{
    [self setFont:[UIFont fontWithName:@"ziffy" size:16.0f]];
    
    self.textColor = fontColor;
    self.text = fontText;
    
}
@end
