//
//  OpenStreetMap.m
//  MapionMaps
//
//  Created by honjo on 12/08/02.
//  Copyright (c) 2012 Mapion Co.,Ltd. All rights reserved.
//

#import "OpenStreetMap.h"

@implementation OpenStreetMap

- (id)init {
	if (!(self = [super init])) return nil;
  
  self.maxZoom = 18;
  self.minZoom = 0;
  self.name = @"OpenStreetMap";
  self.version = @"";
  self.copyright = @"Map data © OpenStreetMap contributors, CC BY-SA";
  
	return self;
}

- (NSURL *)URLForTile:(MMTile)tile {
  NSString *urlString = [NSString stringWithFormat:@"http://tile.openstreetmap.org/%d/%d/%d.png", tile.zoom, tile.x, tile.y];
  
//  NSLog(@"url:%@", urlString);
	return [NSURL URLWithString:urlString];
}

@end
