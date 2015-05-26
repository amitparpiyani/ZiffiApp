//
//  MetaInfo.h
//  Ziffi
//
//  Created by Amit Parpiyani on 19/05/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>

@protocol MetaInfo
@end

@interface MetaInfo : JSONModel
@property(nonatomic,assign)NSInteger page;
@property(nonatomic,assign)NSInteger resultCount;
@property(nonatomic,assign)NSInteger resultsPerPage;
@property (nonatomic,strong)NSString *vertical;
@property (nonatomic,strong)NSString *cityName;
@property(nonatomic,assign)NSInteger cityId;
@property (nonatomic,strong)NSString *searchString;
@property (nonatomic,strong)NSString<Optional> *cordinates;
@property (nonatomic,strong)NSString<Optional> *location;









@end
