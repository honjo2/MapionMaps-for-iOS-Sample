//
//  MMMapView.h
//  MapionMaps
//
//  Created by honjo on 12/05/08.
//  Copyright (c) 2012 Mapion Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <QuartzCore/QuartzCore.h>

#import "MMFoundation.h"
#import "MMMap.h"

@class MMMapView;
@class MMTiledLayerView;
@class MMAnnotationView;
@class MMPolylineView;

@protocol MMTiledLayerViewDelegate;

@protocol MMMapViewDelegate <NSObject>

@optional

- (void)beforeMapMove:(MMMapView *)mapView;
- (void)afterMapMove:(MMMapView *)mapView;

- (void)beforeMapZoom:(MMMapView *)mapView;
- (void)afterMapZoom:(MMMapView *)mapView;

- (void)doubleTap:(MMMapView *)mapView point:(CGPoint)point;
- (void)singleTap:(MMMapView *)mapView point:(CGPoint)point;
- (void)singleTapTwoFingers:(MMMapView *)mapView point:(CGPoint)point;
- (void)longSingleTap:(MMMapView *)mapView point:(CGPoint)point;

- (void)tapOnPopup:(MMMapView *)mapView annotationView:(MMAnnotationView *)annotationView control:(UIControl *)control;

@end

@interface MMMapView : UIView

@property (nonatomic, assign) id <MMMapViewDelegate> delegate;
@property (nonatomic, assign) CLLocationCoordinate2D centerCoordinate;
@property (nonatomic, assign) float zoom;
@property (nonatomic, readonly) float screenScale;
@property (nonatomic, retain) id <MMMap> map;
@property (nonatomic, retain) MMAnnotationView *openAnnotation;

- (id)initWithFrame:(CGRect)frame key:(NSString *)key;
- (id)initWithFrame:(CGRect)frame key:(NSString *)key map:(id <MMMap>)map;
- (void)setCenterCoordinate:(CLLocationCoordinate2D)coordinate animated:(BOOL)animated;
- (void)setCenterProjectedPoint:(MMProjectedPoint)projectedPoint animated:(BOOL)animated;

- (CGPoint)projectedPointToPixel:(MMProjectedPoint)projectedPoint;
- (MMProjectedPoint)pixelToProjectedPoint:(CGPoint)pixelCoordinate;

- (CGPoint)coordinateToPixel:(CLLocationCoordinate2D)coordinate;
- (CLLocationCoordinate2D)pixelToCoordinate:(CGPoint)pixelCoordinate;

- (MMProjectedPoint)coordinateToProjectedPoint:(CLLocationCoordinate2D)coordinate;
- (CLLocationCoordinate2D)projectedPointToCoordinate:(MMProjectedPoint)projectedPoint;

- (CGPoint)coordinateToAbsolutePixel:(CLLocationCoordinate2D)coordinate;
- (CGPoint)projectedPointToAbsolutePixel:(MMProjectedPoint)projectedPoint;

- (CGPoint)coordinateToScaledPixel:(CLLocationCoordinate2D)coordinate;
- (CGPoint)projectedPointToScaledPixel:(MMProjectedPoint)projectedPoint;

- (void)setZoom:(float)zoom animated:(BOOL)animated;

- (NSArray *)annotations;
- (void)addAnnotation:(MMAnnotationView *)annotation;
- (void)addAnnotation:(MMAnnotationView *)annotation animated:(BOOL)animated;
- (void)addAnnotations:(NSArray *)annotations;
- (void)addAnnotations:(NSArray *)annotations animated:(BOOL)animated;
- (void)removeAnnotation:(MMAnnotationView *)annotation;
- (void)removeAnnotations:(NSArray *)annotations;

- (MMPolylineView *)newPolyline;
- (MMPolylineView *)polylineAtIndex:(int)index;
- (void)removePolyline:(MMPolylineView *)polyline;

@end
