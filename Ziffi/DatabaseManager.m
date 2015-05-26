//
//  DatabaseManager.m
//  Ziffi
//
//  Created by Amit Parpiyani on 25/05/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import "DatabaseManager.h"
#import <CoreData/CoreData.h>
#import "ZiffiSaloonManager.h"
#import "AppDelegate.h"
#import "ZiffiSaloonInfo.h"
#import "SaloonSearchResult.h"

@implementation DatabaseManager


- (id)init
{
    self = [super init];
    if(self)
    {
        // NSManagedObjectContext *con = [self managedObjectContext];
    }
    return self;
}

- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    
    id delegate = [[UIApplication sharedApplication] delegate];
    
    if ([delegate performSelector:@selector(managedObjectContext)])
    {
        context = [delegate managedObjectContext];
    }
    return context;
}

-(void)fillZiffiSaloonInfo:(ZiffiSaloonInfo *)saloonInfo
{
    saloonInfo.saloonsInformation = [[ZiffiSaloonManager getInstance] getSaloonArray];
    NSInteger totalResults = [[ZiffiSaloonManager getInstance] getSaloonResult].metaInfo.resultCount;
    saloonInfo.totalResults = [[NSNumber alloc] initWithInteger:totalResults];
    saloonInfo.loadedResults = [[NSNumber alloc] initWithInteger:[[[ZiffiSaloonManager getInstance] getSaloonArray] count]];
    saloonInfo.pagesLoaded = [[NSNumber alloc] initWithInteger:[[ZiffiSaloonManager getInstance] loadedPagesCount]];
    
}
-(ZiffiSaloonInfo *)fetchZiffiSaloonInformation
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSManagedObjectContext *context = [self managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ZiffiSaloonInfo" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error = nil;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects != nil && [fetchedObjects count]> 0)
    {
        return [fetchedObjects objectAtIndex:0];
    
    }
    return nil;
    
}

-(void)saveLoadedData
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSManagedObjectContext *context = [self managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ZiffiSaloonInfo" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error = nil;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects != nil && [fetchedObjects count]> 0)
    {
        for (ZiffiSaloonInfo *saloonInfo in fetchedObjects)
        {
            [context deleteObject:saloonInfo];
        }
        
    }
    ZiffiSaloonInfo *ziffiSaloon = [NSEntityDescription insertNewObjectForEntityForName:@"ZiffiSaloonInfo" inManagedObjectContext:context];
    [self fillZiffiSaloonInfo:ziffiSaloon];
    [context save:&error];
    
    
}



@end
