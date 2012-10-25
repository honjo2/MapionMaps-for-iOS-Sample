//
//  MMCircle.h
//  MapionMaps
//
//  Created by honjo on 12/10/23.
//  Copyright (c) 2012 Mapion Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MMOverlay.h"
#import "MMFoundation.h"

@class MMMapView;

@interface MMCircle : MMOverlay

@property (nonatomic, assign) MMProjectedPoint projectedLocation;
@property (nonatomic, retain) CAShapeLayer *shapeLayer;
@property (nonatomic, retain) UIColor *lineColor;
@property (nonatomic, retain) UIColor *fillColor;
@property (nonatomic, assign) CGFloat radiusInMeters;
@property (nonatomic, assign) CGFloat lineWidthInPixels;

- (id)initWithMapView:(MMMapView *)mapView center:(CLLocationCoordinate2D)center r:(CGFloat)r;

@end
