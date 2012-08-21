//
//  MapionTownMap.m
//  MapionMaps for iOS Sample
//
//  Created by honjo on 12/08/02.
//  Copyright (c) 2012 Mapion Co.,Ltd. All rights reserved.
//

#import "MapionTownMap.h"

@implementation MapionTownMap

@synthesize minZoom = minZoom_;
@synthesize maxZoom = maxZoom_;
@synthesize tileLength = tileLength_;
@synthesize projectedRect = projectedRect_;
@synthesize name = name_;
@synthesize version = version_;
@synthesize copyright = copyright_;

- (id)init {
	if (!(self = [super init])) return nil;
  
  float screenScale = 1.0;
  if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
    screenScale = [[[UIScreen mainScreen] valueForKey:@"scale"] floatValue];
  }
  float maxLength = 256 / screenScale;
  
  self.projectedRect = MMProjectedRectMake(-maxLength, -maxLength, maxLength * 2, maxLength * 2);
  
  self.tileLength = 256;
  self.maxZoom = 2;
  self.minZoom = 0;
  
  self.name = @"MapionTown";
  self.version = @"";
  self.copyright = @"© Mapion";
  
	return self;
}

#pragma mark - MMMap

- (UIImage *)imageForTile:(MMTile)tile {
  NSString *fileName = [self tileToFileName:tile];
  return [UIImage imageNamed:fileName];
}

- (CLLocationCoordinate2D)projectedPointToCoordinate:(MMProjectedPoint)point {
  CLLocationCoordinate2D coordinate;
  coordinate.latitude = point.y;
  coordinate.longitude = point.x;
  return coordinate;
}

- (MMProjectedPoint)coordinateToProjectedPoint:(CLLocationCoordinate2D)coordinate {
  MMProjectedPoint point;
  point.x = coordinate.longitude;
  point.y = coordinate.latitude;
  return point;
}

#pragma mark - Private

- (NSString *)tileToFileName:(MMTile)tile {
  double p = pow(2.0, tile.zoom);
  int x = tile.x;
  int y = tile.y;
  
  NSMutableString *tileName = [NSMutableString string];
  [tileName appendString:@"t"];
  for (int i = 0; i < tile.zoom; i++) {
    p = p / 2;
    if (y < p) {
      if (x < p) {
        [tileName appendString:@"q"];
      } else {
        [tileName appendString:@"r"];
        x -= p;
      }
    } else {
      if (x < p) {
        [tileName appendString:@"t"];
        y -= p;
      } else {
        [tileName appendString:@"s"];
        x -= p;
        y -= p;
      }
    }
  }
  [tileName appendString:@".jpg"];
  return tileName;
}

@end
