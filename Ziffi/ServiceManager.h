//
//  ServiceManager.h
//  Ziffi
//
//  Created by Amit Parpiyani on 18/05/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^RequestCompletionBlock) (BOOL success,NSString *responseString,NSError *error);

@interface ServiceManager : NSObject
+(void)searchZiffiForWithCriteria:(NSString *)searchCriteria andCompletionBlock:(RequestCompletionBlock)reqCompletionBlock;
@end
