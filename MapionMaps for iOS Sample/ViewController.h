//
//  ViewController.h
//  MapionMaps for iOS Sample
//
//  Created by honjo on 12/08/02.
//  Copyright (c) 2012 Mapion Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapionMaps/MapionMaps.h>

@interface ViewController : UIViewController <MMMapViewDelegate>

@property (nonatomic, retain) MMMapView *mapView;

@end
