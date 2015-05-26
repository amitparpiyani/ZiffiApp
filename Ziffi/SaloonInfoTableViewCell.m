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
#import "Saloon.h"
#import "Constants.h"
#import "UIColor-Expanded.h"

@interface SaloonInfoTableViewCell ()
{
    Saloon *currentSaloon;
}
@end

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
    self.loadingIndicator.hidden = NO;
    [self.loadingIndicator startAnimating];
    [self.saloonImg sd_setImageWithURL:[NSURL URLWithString:path] placeholderImage:[UIImage imageNamed:@"placeholder.png"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [self.loadingIndicator stopAnimating];
        self.loadingIndicator.hidden = YES;
    
                                       }];
}

-(void)setupCellWithSaloon:(Saloon *)saloon
{
    currentSaloon = saloon;
    [self updateMovieThumbnail:currentSaloon.imageUrl];
    [self setMinServiceLabel];
    self.saloonAddress.text  = currentSaloon.address;
    self.saloonName.text = currentSaloon.saloonName;
    self.saloonType.text = currentSaloon.saloonType;
    [self setRating:[currentSaloon.rating floatValue]];
    NSMutableAttributedString *distanceAttributedStr = [[NSMutableAttributedString alloc] initWithString:@"2.35km"];
    [distanceAttributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:ATTRIBUTED_LBL_COLOR] range:NSMakeRange(0, 6)];
    self.saloonDistance.attributedText = distanceAttributedStr;
    
}

-(void)setMinServiceLabel
{
    NSString *minFeesString = [NSString stringWithFormat:@"%@ %ld %@ %@",RUPEE_SYMBOL_UNICODE,(long)currentSaloon.minFees,NSLocalizedString(@"for", @"For text"),currentSaloon.minFeesService];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:minFeesString];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:ATTRIBUTED_LBL_COLOR] range:[minFeesString rangeOfString:[NSString stringWithFormat:@"%ld",(long)currentSaloon.minFees]]];
    self.minServiceRate.attributedText = attributedString;
    
    
}
-(void)setRating:(float)rating
{
    [self.firstStarLbl setFilledTTFFont:EMPTY_STAR_FONT_VALUE withFontSize:18.0 fontColor:[UIColor whiteColor] fromRating:rating];
    [self.secondStarLbl setFilledTTFFont:EMPTY_STAR_FONT_VALUE withFontSize:18.0 fontColor:[UIColor whiteColor] fromRating:rating];

    [self.thirdStarLbl setFilledTTFFont:EMPTY_STAR_FONT_VALUE withFontSize:18.0 fontColor:[UIColor whiteColor] fromRating:rating];
    [self.fourthStarLbl setFilledTTFFont:EMPTY_STAR_FONT_VALUE withFontSize:18.0 fontColor:[UIColor whiteColor] fromRating:rating];

    [self.fifthStarLbl setFilledTTFFont:EMPTY_STAR_FONT_VALUE withFontSize:18.0 fontColor:[UIColor whiteColor] fromRating:rating];
    
    

    
}


@end
