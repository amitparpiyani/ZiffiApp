//
//  ZiffiSaloonManager.h
//  Ziffi
//
//  Created by Amit Parpiyani on 20/05/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SaloonSearchResult;
@interface ZiffiSaloonManager : NSObject

+ (ZiffiSaloonManager *)getInstance;
-(NSInteger)getLoadedSaloonCount;
-(SaloonSearchResult *)getSaloonResult;
-(NSArray *)getSaloonArray;
-(NSInteger )loadedPagesCount;
- (BOOL)iSFetchInProgress;
-(void)fetchDataFromServerForPageNO:(NSInteger)pageNo;
-(void)fetchNewDataFromServer;

@end
