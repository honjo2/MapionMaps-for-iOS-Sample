//
//  MapionTownMap.h
//  MapionMaps for iOS Sample
//
//  Created by honjo on 12/08/02.
//  Copyright (c) 2012 Mapion Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapionMaps/MapionMaps.h>

@interface MapionTownMap : NSObject <MMMap>

@property (nonatomic, assign) float minZoom;
@property (nonatomic, assign) float maxZoom;
@property (nonatomic, assign) NSUInteger tileLength;
@property (nonatomic, assign) MMProjectedRect projectedRect;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *version;
@property (nonatomic, retain) NSString *copyright;

@end
