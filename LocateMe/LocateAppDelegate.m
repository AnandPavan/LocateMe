//
//  LocateAppDelegate.m
//  LocateMe
//
//  Created by Anand on 5/29/14.
//  Copyright (c) 2014 Anand. All rights reserved.
//

#import "LocateAppDelegate.h"

@implementation LocateAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.manager = [PKManager managerWithDelegate:self];
    [self.manager start];
    
    [application setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    self.isApplicationInBackground = YES;
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    self.isApplicationInBackground = NO;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void) application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    // Called when updating applicaiton data in the background. Requires that UIBackgroundModes contains "fetch" in the applications's Info.plist. See PKExample-Info.plist for an example.
    [self.manager syncWithCompletionHandler: completionHandler];
}

#pragma mark Proximity Kit Delegate Methods

- (void)proximityKitDidSync:(PKManager *)manager {
   
}
- (void)proximityKit:(PKManager *)manager didEnter:(PKRegion*)region {
    
    if(self.isApplicationInBackground){
        [self showLocalNotification:region.name];
    }
    [self.locationUpdateDelegate updateBuilding:region];
    
}

- (void)proximityKit:(PKManager *)manager didExit:(PKRegion *)region {
 
}

- (void)proximityKit:(PKManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Error: %@", error.description);
}

- (void)showLocalNotification:(NSString *)locationName{
    
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    UILocalNotification *localNotification = [[UILocalNotification alloc]init];
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:0];
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.alertBody = [NSString stringWithFormat:@"Welcome to Building %@",locationName];
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    
    //schedule notification at its time
    [[UIApplication sharedApplication]scheduleLocalNotification:localNotification];
}

@end
