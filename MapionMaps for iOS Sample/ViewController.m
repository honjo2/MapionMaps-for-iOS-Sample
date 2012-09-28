//
//  ViewController.m
//  MapionMaps for iOS Sample
//
//  Created by honjo on 12/08/02.
//  Copyright (c) 2012 Mapion Co.,Ltd. All rights reserved.
//

#import "ViewController.h"
#import "OpenStreetMap.h"
#import "MapionTownMap.h"

static NSString * const API_KEY = @"APIキー";

@interface ViewController ()

@end

@implementation ViewController {
  UIButton *_button;
  UIButton *_button2;
  id <MMMap> _mapionMap;
  id <MMMap> _openStreetMap;
  id <MMMap> _mapionTownMap;
  BOOL _isFirstPath;
  CLLocationCoordinate2D _tmpCenter;
  int _tmpZoom;
}

@synthesize mapView = mapView_;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  
  _mapionMap = [[[MMMapionMap alloc] init] retain];
  _openStreetMap = [[[OpenStreetMap alloc] init] retain];
  _mapionTownMap = [[[MapionTownMap alloc] init] retain];
  
  self.mapView = [[MMMapView alloc] initWithFrame:self.view.bounds key:API_KEY map:_mapionMap];
  
  CLLocationCoordinate2D coordinate;
  coordinate.latitude = 35.641621;
  coordinate.longitude = 139.749788;
  [self.mapView setZoom:10.3]; // setCoordinateより先にsetZoomする必要がある
  [self.mapView setCenterCoordinate:coordinate animated:NO];
  
  self.mapView.delegate = self;
  
  [self.view addSubview:self.mapView];
  
  _isFirstPath = YES;
  
  [self createTestButton];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
  
  [self dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
//  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
//      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
//  } else {
      return YES;
//  }
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration {
  
  //  CGRect rect = self.view.bounds;
  CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
  CGRect rect = CGRectMake(0, 0, applicationFrame.size.width, applicationFrame.size.height);
  
  CGFloat width, height;
	if ((interfaceOrientation == UIInterfaceOrientationLandscapeLeft)
      || (interfaceOrientation == UIInterfaceOrientationLandscapeRight)) {
    width = rect.size.height;
    height = rect.size.width;
	} else {
    width = rect.size.width;
    height = rect.size.height;
	}
  self.mapView.frame = CGRectMake(0, 0, width, height);
}

- (void)dealloc {
  [mapView_ release]; mapView_ = nil;
  [_button release]; _button = nil;
  [_button2 release]; _button2 = nil;
  [_mapionMap release]; _mapionMap = nil;
  [_openStreetMap release]; _openStreetMap = nil;
  [_mapionTownMap release]; _mapionTownMap = nil;
  [super dealloc];
}

#pragma mark - MMMapViewDelegate

- (void)doubleTap:(MMMapView *)mapView point:(CGPoint)point {
  //  NSLog(@"doubleTap!!!");
}

- (void)singleTap:(MMMapView *)mapView point:(CGPoint)point {
  //  NSLog(@"singleTap!!!");
}

- (void)singleTapTwoFingers:(MMMapView *)mapView point:(CGPoint)point {
  //  NSLog(@"singleTapTwoFingers!!!");
}

- (void)longSingleTap:(MMMapView *)mapView point:(CGPoint)point {
//  NSLog(@"longSingleTap!!!");
  
  CLLocationCoordinate2D coordinate = [mapView_ pixelToCoordinate:point];
  MMAnnotationView *annotationView = [[MMAnnotationView alloc] initWithCoordinate:coordinate mapView:mapView_];
  annotationView.title = [NSString stringWithFormat:@"位置:%f:%f", coordinate.latitude, coordinate.longitude];
  [mapView_ addAnnotation:annotationView animated:YES];
}

- (void)beforeMapMove:(MMMapView *)mapView {
  //  NSLog(@"beforeMapMove!!!");
}

- (void)afterMapMove:(MMMapView *)mapView {
  //  NSLog(@"afterMapMove!!!");
}

- (void)beforeMapZoom:(MMMapView *)mapView {
  //  NSLog(@"beforeMapZoom!!!");
}

- (void)afterMapZoom:(MMMapView *)mapView {
  //  NSLog(@"afterMapZoom!!!");
}

- (void)tapOnPopup:(MMMapView *)mapView annotationView:(MMAnnotationView *)annotationView control:(UIControl *)control {
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:annotationView.title message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:@"閉じる", nil];
  [alert show];
  [alert release];
}

- (NSUInteger)cacheCapacity {
  return 1000;
}

#pragma mark - Private

- (void)createTestButton {
  
  [_button removeFromSuperview]; _button = nil;
  [_button2 removeFromSuperview]; _button2 = nil;
  
  _button = [UIButton buttonWithType:100];
  [_button setTitle:[NSString stringWithUTF8String:"地図切替"] forState:UIControlStateNormal];
  _button.frame = CGRectMake(0, 0, _button.frame.size.width, _button.frame.size.height);
  [_button addTarget:self action:@selector(testButtonOnClick) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:_button];
  
  _button2 = [UIButton buttonWithType:100];
  [_button2 setTitle:[NSString stringWithUTF8String:"地図上クリア"] forState:UIControlStateNormal];
  _button2.frame = CGRectMake(0, 50, _button2.frame.size.width, _button2.frame.size.height);
  [_button2 addTarget:self action:@selector(testButtonOnClick2) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:_button2];
}

- (void)testButtonOnClick {
  _isFirstPath = YES;
  if ([mapView_.map isKindOfClass:[MMMapionMap class]]) {
    mapView_.map = _openStreetMap;
  } else if ([mapView_.map isKindOfClass:[OpenStreetMap class]]) {
    _tmpCenter = mapView_.centerCoordinate;
    _tmpZoom = mapView_.zoom;
    
    CLLocationCoordinate2D zeroCenter;
    zeroCenter.latitude = 0;
    zeroCenter.longitude = 0;
    [mapView_ setCenterCoordinate:zeroCenter];
    
    mapView_.map = _mapionTownMap;
    
    [mapView_ setZoom:1];
    [mapView_ setCenterCoordinate:zeroCenter];
  } else if ([mapView_.map isKindOfClass:[MapionTownMap class]]) {
    mapView_.map = _mapionMap;
    [mapView_ setZoom:_tmpZoom];
    [mapView_ setCenterCoordinate:_tmpCenter];
  }
}

- (void)testButtonOnClick2 {
  [mapView_ removeAnnotations:mapView_.annotations];
  _isFirstPath = YES;
}

@end
