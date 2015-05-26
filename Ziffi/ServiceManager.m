//
//  ServiceManager.m
//  Ziffi
//
//  Created by Amit Parpiyani on 18/05/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import "ServiceManager.h"
#import "AppDelegate.h"
#define BASE_URL @"http://www.ziffi.com/api/search"
@implementation ServiceManager
+ (void)searchZiffiForWithCriteria:(NSString *)searchCriteria andCompletionBlock:(RequestCompletionBlock)reqCompletionBlock
{
    NSURL *url = [[NSURL alloc] initWithString:BASE_URL];
    NSMutableURLRequest *searchRequest = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60.0];
    [searchRequest setHTTPMethod:@"POST"];
    NSData *requestData = [searchCriteria dataUsingEncoding:NSUTF8StringEncoding];
    [searchRequest setHTTPBody:requestData];
    [NSURLConnection sendAsynchronousRequest:searchRequest queue:[AppDelegate connectionQueue]completionHandler:^(NSURLResponse *response,NSData *data,NSError *error)
     {
         if (error || !response || !data)
         {
             reqCompletionBlock(NO,nil,error);
         }
         else
         {
             NSString *responseStr= [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
             reqCompletionBlock(NO,responseStr,nil);
         }
         
     }
     ];

    


}
@end
