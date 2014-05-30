//
//  LocateViewController.h
//  LocateMe
//
//  Created by Anand on 5/29/14.
//  Copyright (c) 2014 Anand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <ProximityKit/ProximityKit.h>
#import "LocateAppDelegate.h"

@interface LocateViewController : UIViewController<MKMapViewDelegate,LocationUpdateDelegate>

@property(nonatomic,weak)IBOutlet UILabel     *welcomeNote;
@property(nonatomic,weak)IBOutlet MKMapView   *mapView;


@end
