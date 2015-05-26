//
//  MetaInfo.m
//  Ziffi
//
//  Created by Amit Parpiyani on 19/05/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import "MetaInfo.h"

@implementation MetaInfo
+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"city_id" : @"cityId",@"results_per_page" : @"resultsPerPage",@"total_results": @"resultCount",@"city_name" : @"cityName",@"q" : @"searchString"}];
}
@end
