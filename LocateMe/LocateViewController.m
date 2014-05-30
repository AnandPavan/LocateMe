//
//  LocateViewController.m
//  LocateMe
//
//  Created by Anand on 5/29/14.
//  Copyright (c) 2014 Anand. All rights reserved.
//
#import <ProximityKit/PKCircle.h>
#import "LocateViewController.h"
#import "LocateAnnotation.h"

#define METERS_MILE 1609.344

@interface LocateViewController ()

@end

@implementation LocateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    LocateAppDelegate   *appDelegate   = (LocateAppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.locationUpdateDelegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateBuilding:(PKRegion *)region{
    
    self.welcomeNote.text = [NSString stringWithFormat:@"Welcome to Building %@",region.name];
    
    PKCircle *circle =(PKCircle *)region;
    CLLocationCoordinate2D coordinate1;
    
    coordinate1.latitude = circle.latitude;
    coordinate1.longitude =  circle.longitude;
    
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = coordinate1.latitude;
    zoomLocation.longitude= coordinate1.longitude;
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.2*METERS_MILE, 0.2*METERS_MILE);
    [self.mapView setRegion:viewRegion animated:YES];
    
    self.mapView.delegate = self;
    
    LocateAnnotation *annotation = [[LocateAnnotation alloc] initWithCoordinate:coordinate1 title:region.name];
    [self.mapView addAnnotation:annotation];
    
}
@end
