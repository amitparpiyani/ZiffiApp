//
//  SaloonInfoTableViewCell.h
//  Ziffi
//
//  Created by Amit Parpiyani on 25/05/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SaloonInfoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *saloonImg;
@property (weak, nonatomic) IBOutlet UILabel *saloonAddress;
@property (weak, nonatomic) IBOutlet UILabel *saloonDistance;
@property (weak, nonatomic) IBOutlet UILabel *minServiceRate;
@property (weak, nonatomic) IBOutlet UILabel *saloonName;
@property (weak, nonatomic) IBOutlet UILabel *saloonType;
@property (weak, nonatomic) IBOutlet UILabel *firstStarLbl;
@property (weak, nonatomic) IBOutlet UILabel *secondStarLbl;
@property (weak, nonatomic) IBOutlet UILabel *thirdStarLbl;
@property (weak, nonatomic) IBOutlet UILabel *fourthStarLbl;
@property (weak, nonatomic) IBOutlet UILabel *fifthStarLbl;


-(void)updateMovieThumbnail:(NSString *)path;
-(void)setRating:(NSInteger)rating;

@end
