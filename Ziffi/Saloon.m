//
//  Saloon.m
//  Ziffi
//
//  Created by Amit Parpiyani on 19/05/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import "Saloon.h"

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
    [aCoder encodeObject:self.saloonName forKey:@"saloonName"];
    [aCoder encodeObject:self.imageUrl forKey:@"imageUrl"];
    [aCoder encodeObject:self.location forKey:@"location"];
    [aCoder encodeObject:self.minFeesService forKey:@"minFeesService"];
    [aCoder encodeObject:self.maxFeesService forKey:@"maxFeesService"];
    [aCoder encodeObject:self.maxDistance forKey:@"maxDistance"];
    [aCoder encodeObject:self.minDistance forKey:@"minDistance"];
    [aCoder encodeObject:self.workingDays forKey:@"workingDays"];
    [aCoder encodeObject:self.longitude forKey:@"longitude"];
    [aCoder encodeObject:self.latitude forKey:@"latitude"];
    [aCoder encodeObject:self.offerDescription forKey:@"offerDescription"];
    [aCoder encodeObject:self.offerText forKey:@"offerText"];
    [aCoder encodeObject:self.address forKey:@"address"];
    [aCoder encodeObject:self.saloonType forKey:@"saloonType"];
    [aCoder encodeObject:self.servicesUrl forKey:@"servicesUrl"];
    [aCoder encodeInteger:self.saloonId forKey:@"saloonId"];
    [aCoder encodeInteger:self.rank forKey:@"rank"];
    [aCoder encodeInteger:self.reviewCount forKey:@"reviewCount"];
    [aCoder encodeObject:self.rating forKey:@"rating"];
    [aCoder encodeInteger:self.minFees forKey:@"minFees"];
    [aCoder encodeInteger:self.maxFees forKey:@"maxFees"];
    
    
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self.saloonName =  [aDecoder decodeObjectForKey:@"saloonName"];
    self.imageUrl =  [aDecoder decodeObjectForKey:@"imageUrl"];
    self.location = [aDecoder decodeObjectForKey:@"location"];
    self.minFeesService = [aDecoder decodeObjectForKey:@"minFeesService"];
    self.maxFeesService = [aDecoder decodeObjectForKey:@"maxFeesService"];
    self.maxDistance = [aDecoder decodeObjectForKey:@"maxDistance"];
    self.minDistance = [aDecoder decodeObjectForKey:@"minDistance"];
    self.workingDays = [aDecoder decodeObjectForKey:@"workingDays"];
    self.longitude = [aDecoder decodeObjectForKey:@"longitude"];
    self.latitude = [aDecoder decodeObjectForKey:@"latitude"];
    self.offerDescription = [aDecoder decodeObjectForKey:@"offerDescription"];
    self.offerText = [aDecoder decodeObjectForKey:@"offerText"];
    self.address = [aDecoder decodeObjectForKey:@"address"];
    self.servicesUrl = [aDecoder decodeObjectForKey:@"servicesUrl"];
    self.rating = [aDecoder decodeObjectForKey:@"rating"];
    self.saloonType = [aDecoder decodeObjectForKey:@"saloonType"];
    self.saloonId = [aDecoder decodeIntegerForKey:@"saloonId"];
    self.rank = [aDecoder decodeIntegerForKey:@"rank"];
    self.minFees = [aDecoder decodeIntegerForKey:@"minFees"];
    self.maxFees = [aDecoder decodeIntegerForKey:@"maxFees"];
    self.reviewCount = [aDecoder decodeIntegerForKey:@"reviewCount"];
    
    
    
    return self;
}
@end
