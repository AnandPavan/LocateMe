//
//  LocateAnnotation.h
//  LocateMe
//
//  Created by Anand on 5/29/14.
//  Copyright (c) 2014 Anand. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface LocateAnnotation : NSObject <MKAnnotation>

@property (copy,  nonatomic) NSString *title;
@property (assign,nonatomic) CLLocationCoordinate2D coordinate;

-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title;

@end
