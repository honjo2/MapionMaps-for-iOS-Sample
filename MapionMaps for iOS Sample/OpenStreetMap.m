//
//  OpenStreetMap.m
//  MapionMaps
//
//  Created by honjo on 12/08/02.
//  Copyright (c) 2012 Mapion Co.,Ltd. All rights reserved.
//

#import "OpenStreetMap.h"

@implementation OpenStreetMap

- (int)tileLength {
  return 512;
}

- (float)minZoom {
  return 0;
}

- (float)maxZoom {
  return 18;
}

- (NSString *)name {
  return @"OpenStreetMap";
}

- (NSString *)copyright {
  return @"Map data © OpenStreetMap contributors, CC BY-SA";
}

- (NSURL *)URLForTile:(MMTile)tile {
  NSString *urlString = [NSString stringWithFormat:@"http://tile.openstreetmap.org/%d/%d/%d.png", tile.zoom, tile.x, tile.y];
  
//  NSLog(@"url:%@", urlString);
	return [NSURL URLWithString:urlString];
}

@end
