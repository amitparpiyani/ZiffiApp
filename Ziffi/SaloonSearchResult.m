//
//  SaloonSearchResult.m
//  Ziffi
//
//  Created by Amit Parpiyani on 19/05/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import "SaloonSearchResult.h"

@implementation SaloonSearchResult

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"session_name" : @"sessionName",@"session_id" : @"sessionId",@"meta" : @"metaInfo",@"results" : @"saloonArray"}];
}

@end
