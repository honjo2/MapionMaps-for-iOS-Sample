//
//  MMAnnotationView.h
//  MapionMaps
//
//  Created by honjo on 12/05/16.
//  Copyright (c) 2012 Mapion Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@class MMMapView;
@class MMPopupView;

@interface MMAnnotationView : UIImageView

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) MMPopupView *popupView;
@property (nonatomic, assign) CGPoint centerOffset;
@property (nonatomic, assign) BOOL noDetail;
@property (nonatomic, copy) void (^tapOnPopup)(MMMapView *mapView);

- (id)initWithMapView:(MMMapView *)mapView coordinate:(CLLocationCoordinate2D)coordinate;
- (void)onClick;
- (void)onClose;
- (void)reCalculate;
- (void)setCoordinate:(CLLocationCoordinate2D)coordinate animated:(BOOL)animated;

@end
