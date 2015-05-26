//
//  ZiffiSaloonDataSource.m
//  Ziffi
//
//  Created by Amit Parpiyani on 25/05/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import "ZiffiSaloonDataSource.h"
#import "SaloonSearchResult.h"
#import "ZiffiSaloonManager.h"
#import "SaloonInfoTableViewCell.h"
#import "Constants.h"

@interface ZiffiSaloonDataSource ()
{
    
    
}
@end

@implementation ZiffiSaloonDataSource

- (instancetype)init
{
    return self;
}

#pragma -mark Sallon tableview datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numberOfresults = [[ZiffiSaloonManager getInstance] getLoadedSaloonCount];
    return numberOfresults;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"SaloonInfoCell";
    SaloonInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell==nil)
    {
        cell = [[SaloonInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
        
    }
    [self loadNewDataIfRequired:indexPath.row];
    NSArray *saloonArray = [[ZiffiSaloonManager getInstance]getSaloonArray];
    Saloon *currentSaloon = [saloonArray objectAtIndex:indexPath.row];
    cell.saloonAddress.text  = currentSaloon.address;
    cell.minServiceRate.text = [NSString stringWithFormat:@"%@ %ld %@ %@",RUPEE_SYMBOL_UNICODE,(long)currentSaloon.minFees,NSLocalizedString(@"for", @"For text"),currentSaloon.minFeesService];
    
    cell.saloonName.text = currentSaloon.saloonName;
    cell.saloonType.text = currentSaloon.saloonType;
    [cell setRating:[currentSaloon.rating integerValue]];
    [cell updateMovieThumbnail:currentSaloon.imageUrl];
    
    return cell;
}

-(void)loadNewDataIfRequired:(NSInteger)currentRow
{
    if (currentRow > [[ZiffiSaloonManager getInstance] getLoadedSaloonCount]-5 && currentRow < [[ZiffiSaloonManager getInstance] getSaloonResult].metaInfo.resultCount && ![[ZiffiSaloonManager getInstance] iSFetchInProgress])
    {
        [[ZiffiSaloonManager getInstance] fetchSaloonResultsFromServer];
    }
}

#pragma 

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 230.0f;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UIView *rootView = [[[UIApplication sharedApplication] keyWindow]
//                        rootViewController].view;
//    CGRect originalFrame = [[UIScreen mainScreen] bounds];
//    CGRect adjustedFrame = [rootView convertRect:originalFrame fromView:nil];
//    return (adjustedFrame.size.width * 0.8)+45;
//}

@end
