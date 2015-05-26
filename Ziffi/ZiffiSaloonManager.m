//
//  ZiffiSaloonManager.m
//  Ziffi
//
//  Created by Amit Parpiyani on 20/05/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import "ZiffiSaloonManager.h"
#import "ServiceManager.h"
#import <JSONModel.h>
#import "SaloonSearchResult.h"
#import "AppDelegate.h"
#import "DatabaseManager.h"
#import "ZiffiSaloonInfo.h"

@interface ZiffiSaloonManager ()
{
    NSInteger numberOfPagesLoaded;
    NSInteger numberOfResultsLoaded;
    NSInteger maxNumberOfPages;
    NSString *searchString;
    SaloonSearchResult *saloonResult;
    NSMutableArray *allSaloonRecords;
    BOOL bDataFetchInProgress;

}

@end
@implementation ZiffiSaloonManager
+ (ZiffiSaloonManager *)getInstance
{
    static ZiffiSaloonManager *ziffiSaloonManager;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        ziffiSaloonManager = [[ZiffiSaloonManager alloc] init];
    });
    return ziffiSaloonManager;
}

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        numberOfPagesLoaded = 0;
        bDataFetchInProgress = NO;
        allSaloonRecords = [[NSMutableArray alloc] init];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWillResignActive) name:UIApplicationWillResignActiveNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWillResignActive) name:UIApplicationWillTerminateNotification object:nil];

        DatabaseManager *databaseManager = [[DatabaseManager alloc] init];
        ZiffiSaloonInfo *ziffiSaloonInfo = [databaseManager fetchZiffiSaloonInformation];
        [self updateZiffiManagerFromDB:ziffiSaloonInfo];
        


        
    }
    return self;
}

-(void)updateZiffiManagerFromDB:(ZiffiSaloonInfo *)ziffiSaloonInfo
{
    numberOfPagesLoaded = [ziffiSaloonInfo.pagesLoaded integerValue];
    numberOfResultsLoaded = [ziffiSaloonInfo.loadedResults integerValue];
    [allSaloonRecords addObjectsFromArray:ziffiSaloonInfo.saloonsInformation];
    
}
-(void)fetchDataFromServerForPageNO:(NSInteger)pageNo
{
    searchString = [NSString stringWithFormat:@"%@=%@&%@=%d&%@=%@&%@=%@",@"vertical",@"salons-spas",@"city_id",4,@"q",@"Hair",@"page",[NSString stringWithFormat:@"%ld",pageNo]];
    [self fetchSaloonResultsFromServer:searchString];

    
    
    
}

-(void)fetchNewDataFromServer
{
    searchString = [NSString stringWithFormat:@"%@=%@&%@=%d&%@=%@&%@=%@",@"vertical",@"salons-spas",@"city_id",4,@"q",@"Hair",@"page",[NSString stringWithFormat:@"%ld",numberOfPagesLoaded+1]];
    [self fetchSaloonResultsFromServer:searchString];

}
-(void)fetchSaloonResultsFromServer:(NSString *)searsParams
{
    bDataFetchInProgress = YES;
    

    [ServiceManager searchZiffiForWithCriteria:searsParams andCompletionBlock:^(BOOL success,NSString *responseString,NSError *error)
     {
         if (error) {
             NSLog(@"%@",[error description]);
         }
         else
         {
             JSONModelError *jsonError;
             saloonResult = [[SaloonSearchResult alloc] initWithString:responseString error:&jsonError];
             [allSaloonRecords addObjectsFromArray:saloonResult.saloonArray];
             numberOfResultsLoaded = [allSaloonRecords count];
             numberOfPagesLoaded = saloonResult.metaInfo.page;
             NSLog(@"Number of pages loaded %ld",(long)numberOfPagesLoaded);
             // [movieList addObjectsFromArray:searchMoviesResult.moviesArray];
             dispatch_async(dispatch_get_main_queue(), ^{
                 
                 bDataFetchInProgress = NO;
                 [[NSNotificationCenter defaultCenter] postNotificationName:@"SaloonDataUpdated" object:nil];
                 
             });
             
         }
         
     }
     ];
    
}
-(NSInteger)getLoadedSaloonCount
{
    return numberOfResultsLoaded;
}

- (SaloonSearchResult *)getSaloonResult
{
    return saloonResult;
}
-(NSArray *)getSaloonArray
{
    return allSaloonRecords;
}

- (NSInteger )loadedPagesCount
{
    return numberOfPagesLoaded;
}
- (BOOL)iSFetchInProgress
{
    return bDataFetchInProgress;
}

-(void)appWillResignActive
{
    DatabaseManager *databaseManager = [[DatabaseManager alloc] init];
    [databaseManager saveLoadedData];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillResignActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillTerminateNotification object:nil];

}
@end
