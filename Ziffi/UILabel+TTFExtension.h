//
//  UILabel+TTFExtension.h
//  Ziffi
//
//  Created by Amit Parpiyani on 25/05/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (TTFExtension)
-(void)setFilledTTFFont:(NSString *)fontText withFontSize:(float)fontSize fontColor:(UIColor *)fontColor fromRating:(NSInteger)rating;

- (void)setTTFFont:(NSString *)fontText withFontSize:(float)fontSize fontColor:(UIColor *)fontColor;

@end
