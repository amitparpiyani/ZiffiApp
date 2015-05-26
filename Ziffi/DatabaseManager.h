//
//  DatabaseManager.h
//  Ziffi
//
//  Created by Amit Parpiyani on 25/05/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZiffiSaloonInfo;
@interface DatabaseManager : NSObject

//+()fetchSaloonInformationUsingContext:(NSMa)
-(void)saveLoadedData;
-(ZiffiSaloonInfo *)fetchZiffiSaloonInformation;
@end
