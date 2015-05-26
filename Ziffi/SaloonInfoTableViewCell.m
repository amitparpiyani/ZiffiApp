//
//  SaloonInfoTableViewCell.m
//  Ziffi
//
//  Created by Amit Parpiyani on 25/05/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import "SaloonInfoTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UILabel+TTFExtension.h"


@implementation SaloonInfoTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self.saloonName setTextColor:[UIColor whiteColor]];
    [self.saloonType setTextColor:[UIColor whiteColor]];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)updateMovieThumbnail:(NSString *)path
{
//    [self.saloonImg sd_setImageWithURL:[NSURL URLWithString:path]
//                        placeholderImage:[UIImage imageNamed:@"placeholder.png"]
//                               completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//                               }];
    
    [self.saloonImg sd_setImageWithURL:[NSURL URLWithString:path] placeholderImage:[UIImage imageNamed:@"placeholder.png"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                       }];
}

-(void)setRating:(NSInteger)rating
{
    [self.firstStarLbl setFilledTTFFont:@"r" withFontSize:18.0 fontColor:[UIColor whiteColor] fromRating:rating];
    [self.secondStarLbl setFilledTTFFont:@"r" withFontSize:18.0 fontColor:[UIColor whiteColor] fromRating:rating];

    [self.thirdStarLbl setFilledTTFFont:@"r" withFontSize:18.0 fontColor:[UIColor whiteColor] fromRating:rating];
    [self.fourthStarLbl setFilledTTFFont:@"r" withFontSize:18.0 fontColor:[UIColor whiteColor] fromRating:rating];

    [self.fifthStarLbl setFilledTTFFont:@"r" withFontSize:18.0 fontColor:[UIColor whiteColor] fromRating:rating];
    
    

    
}


@end
