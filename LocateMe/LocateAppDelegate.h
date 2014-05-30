//
//  LocateAppDelegate.h
//  LocateMe
//
//  Created by Anand on 5/29/14.
//  Copyright (c) 2014 Anand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ProximityKit/ProximityKit.h>


@protocol LocationUpdateDelegate <NSObject>

- (void)updateBuilding:(PKRegion *)region;

@end


@interface LocateAppDelegate : UIResponder <UIApplicationDelegate,PKManagerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) PKManager *manager;
@property (weak,   nonatomic) id<LocationUpdateDelegate> locationUpdateDelegate;
@property (assign) BOOL                 isApplicationInBackground;

- (void)showLocalNotification:(NSString *)nameLocation;

@end
