//
//  SaloonSearchResult.h
//  Ziffi
//
//  Created by Amit Parpiyani on 19/05/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>
#import "Saloon.h"
#import "MetaInfo.h"
@interface SaloonSearchResult : JSONModel
@property(nonatomic,strong)NSArray <Saloon> *saloonArray;
@property(nonatomic,strong)MetaInfo *metaInfo;
@property(nonatomic,strong)NSString *sessionId;
@property(nonatomic,strong)NSString *sessionName;

@end
