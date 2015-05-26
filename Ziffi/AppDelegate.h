//
//  AppDelegate.h
//  Ziffi
//
//  Created by Amit Parpiyani on 18/05/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (NSOperationQueue *)connectionQueue;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

