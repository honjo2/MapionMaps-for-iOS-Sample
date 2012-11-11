//
//  MMMapView.h
//  MapionMaps
//
//  Created by honjo on 12/05/08.
//  Copyright (c) 2012 Mapion Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMMap.h"

@class MMMapView;
@class MMAnnotationView;
@class MMOverlay;

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

- (void)zoomIn:(MMMapView *)mapView point:(CGPoint)point;
- (void)zoomOut:(MMMapView *)mapView point:(CGPoint)point;

- (NSUInteger)cacheCapacity;

@end

@interface MMMapView : UIView

@property (nonatomic, assign) double metersPerPixel;
@property (nonatomic, retain) id <MMMap> map;
@property (nonatomic, readonly) NSArray *maps;
@property (nonatomic, assign) float zoom;
@property (nonatomic, assign) id <MMMapViewDelegate> delegate;
@property (nonatomic, assign) CLLocationCoordinate2D centerCoordinate;
@property (nonatomic, assign) MMProjectedPoint centerProjectedPoint;
@property (nonatomic, retain) MMAnnotationView *openAnnotation;
@property (nonatomic, assign) float degrees;

- (id)initWithFrame:(CGRect)frame key:(NSString *)key;
- (id)initWithFrame:(CGRect)frame key:(NSString *)key map:(id <MMMap>)map;

- (void)setCenterCoordinate:(CLLocationCoordinate2D)coordinate animated:(BOOL)animated;
- (void)setCenterProjectedPoint:(MMProjectedPoint)point animated:(BOOL)animated;

- (MMProjectedPoint)pixelToProjectedPoint:(CGPoint)pixel;
- (MMProjectedPoint)coordinateToProjectedPoint:(CLLocationCoordinate2D)coordinate;
- (CGPoint)coordinateToPixel:(CLLocationCoordinate2D)coordinate;
- (CLLocationCoordinate2D)pixelToCoordinate:(CGPoint)pixel;
- (CGPoint)projectedPointToPixel:(MMProjectedPoint)projectedPoint;

- (NSArray *)annotations;
- (void)addAnnotation:(MMAnnotationView *)annotation;
- (void)addAnnotation:(MMAnnotationView *)annotation animated:(BOOL)animated;
- (void)addAnnotations:(NSArray *)annotations;
- (void)addAnnotations:(NSArray *)annotations animated:(BOOL)animated;
- (void)removeAnnotation:(MMAnnotationView *)annotation;
- (void)removeAnnotations:(NSArray *)annotations;

- (NSArray *)overlays;
- (void)addOverlay:(MMOverlay *)overlay;
- (void)addOverlays:(NSArray *)overlays;
- (void)removeOverlay:(MMOverlay *)overlay;
- (void)removeOverlays:(NSArray *)overlays;

- (void)zoomTo:(float)zoomFactor point:(CGPoint)point;
- (BOOL)containPoint:(CGPoint)point;

- (void)removeAllCache;

- (void)addMap:(id <MMMap>)map;
- (void)addMap:(id <MMMap>)map atIndex:(NSUInteger)index;
- (void)removeMap:(id <MMMap>)map;
- (void)removeMapAtIndex:(NSUInteger)index;

- (CGRect)scrollViewFrame;

@end
