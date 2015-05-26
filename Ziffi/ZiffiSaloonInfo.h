//
//  ZiffiSaloonInfo.h
//  Ziffi
//
//  Created by Amit Parpiyani on 25/05/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ZiffiSaloonInfo : NSManagedObject

@property (nonatomic, retain) NSNumber * totalResults;
@property (nonatomic, retain) NSNumber * pagesLoaded;
@property (nonatomic, retain) NSNumber * loadedResults;
@property (nonatomic, retain) id saloonsInformation;

@end
