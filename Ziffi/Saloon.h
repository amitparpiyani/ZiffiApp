//
//  Saloon.h
//  Ziffi
//
//  Created by Amit Parpiyani on 19/05/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>
@protocol  Saloon

@end


@interface Saloon : JSONModel<NSCoding>
@property(nonatomic,assign)NSInteger saloonId;
@property(nonatomic,strong)NSString *saloonName;
@property(nonatomic,strong)NSString *location;
@property (nonatomic,strong)NSString *address;
@property (nonatomic,strong)NSString<Optional> *minFeesService;
@property (nonatomic,strong)NSString<Optional> *maxFeesService;
@property (nonatomic,assign)NSInteger reviewCount;
@property (nonatomic,assign)NSInteger  minFees;
@property (nonatomic,assign)NSInteger maxFees;
@property (nonatomic,strong)NSString *rating;
@property (nonatomic,strong)NSString <Optional> *maxDistance;
@property (nonatomic,strong)NSString <Optional> *minDistance;
@property (nonatomic,strong)NSString *workingDays;
@property (nonatomic,strong)NSString *longitude;
@property (nonatomic,strong)NSString *latitude;
@property (nonatomic,strong)NSString <Optional> *offerText;
@property (nonatomic,strong)NSString <Optional> *offerDescription;
@property (nonatomic,assign)NSInteger rank;
@property (nonatomic,strong)NSString *saloonType;
@property (nonatomic,strong)NSString <Optional> *imageUrl;
@property (nonatomic,strong)NSString *servicesUrl;















@end
