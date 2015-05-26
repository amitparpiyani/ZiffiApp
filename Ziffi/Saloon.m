//
//  Saloon.m
//  Ziffi
//
//  Created by Amit Parpiyani on 19/05/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import "Saloon.h"
#import "Constants.h"
@implementation Saloon
+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id" : @"saloonId", @"name" : @"saloonName",@"reviews_count" : @"reviewCount",@"fees_min_service" : @"minFeesService",@"fees_max_service" : @"maxFeesService",@"fees_max" : @"maxFees",@"fees_min": @"minFees",@"working_at" : @"workingDays",@"image" : @"imageUrl",@"services" : @"servicesUrl",@"type" : @"saloonType",@"distance_min" : @"minDistance",@"distance_max" : @"maxDistance",@"offer_text" :@"offerText", @"offer_description" : @"offerDescription" }];
}
//Should not do this
+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}

#pragma NSCoding Protocol
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.saloonName forKey:SALOON_NAME_KEY];
    [aCoder encodeObject:self.imageUrl forKey:IMAGE_URL_KEY];
    [aCoder encodeObject:self.location forKey:LOCATION_KEY];
    [aCoder encodeObject:self.minFeesService forKey:MIN_FEESERVICE_KEY];
    [aCoder encodeObject:self.maxFeesService forKey:MAX_FEESSERVICE_KEY];
    [aCoder encodeObject:self.maxDistance forKey:MAX_DISTANCE_KEY];
    [aCoder encodeObject:self.minDistance forKey:MIN_DISTANCE_KEY];
    [aCoder encodeObject:self.workingDays forKey:WORKING_DAYS_KEY];
    [aCoder encodeObject:self.longitude forKey:LONGITUDE_KEY];
    [aCoder encodeObject:self.latitude forKey:LATITUDE_KEY];
    [aCoder encodeObject:self.offerDescription forKey:OFFER_DESC_KEY];
    [aCoder encodeObject:self.offerText forKey:OFFER_TEXT_KEY];
    [aCoder encodeObject:self.address forKey:ADDRESS_KEY];
    [aCoder encodeObject:self.saloonType forKey:SALOON_TYPE_KEY];
    [aCoder encodeObject:self.servicesUrl forKey:SERVICES_URL_KEY];
    [aCoder encodeInteger:self.saloonId forKey:SALOON_ID_KEY];
    [aCoder encodeInteger:self.rank forKey:RANK_KEY];
    [aCoder encodeInteger:self.reviewCount forKey:REVIEW_COUNT_KEY];
    [aCoder encodeObject:self.rating forKey:RATING_KEY];
    [aCoder encodeInteger:self.minFees forKey:MIN_FEES_KEY];
    [aCoder encodeInteger:self.maxFees forKey:MAX_FEES_KEY];
    
    
    
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self.saloonName =  [aDecoder decodeObjectForKey:SALOON_NAME_KEY];
    self.imageUrl =  [aDecoder decodeObjectForKey:IMAGE_URL_KEY];
    self.location = [aDecoder decodeObjectForKey:LOCATION_KEY];
    self.minFeesService = [aDecoder decodeObjectForKey:MIN_FEESERVICE_KEY];
    self.maxFeesService = [aDecoder decodeObjectForKey:MAX_FEESSERVICE_KEY];
    self.maxDistance = [aDecoder decodeObjectForKey:MAX_DISTANCE_KEY];
    self.minDistance = [aDecoder decodeObjectForKey:MIN_DISTANCE_KEY];
    self.workingDays = [aDecoder decodeObjectForKey:WORKING_DAYS_KEY];
    self.longitude = [aDecoder decodeObjectForKey:LONGITUDE_KEY];
    self.latitude = [aDecoder decodeObjectForKey:LATITUDE_KEY];
    self.offerDescription = [aDecoder decodeObjectForKey:OFFER_DESC_KEY];
    self.offerText = [aDecoder decodeObjectForKey:OFFER_TEXT_KEY];
    self.address = [aDecoder decodeObjectForKey:ADDRESS_KEY];
    self.servicesUrl = [aDecoder decodeObjectForKey:SERVICES_URL_KEY];
    self.rating = [aDecoder decodeObjectForKey:RATING_KEY];
    self.saloonType = [aDecoder decodeObjectForKey:SALOON_TYPE_KEY];
    self.saloonId = [aDecoder decodeIntegerForKey:SALOON_ID_KEY];
    self.rank = [aDecoder decodeIntegerForKey:RANK_KEY];
    self.minFees = [aDecoder decodeIntegerForKey:MIN_FEES_KEY];
    self.maxFees = [aDecoder decodeIntegerForKey:MAX_FEES_KEY];
    self.reviewCount = [aDecoder decodeIntegerForKey:REVIEW_COUNT_KEY];
    
    
    
    return self;
}
@end
