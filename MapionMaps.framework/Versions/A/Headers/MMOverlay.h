//
//  MMOverlay.h
//  MapionMaps
//
//  Created by honjo on 12/10/24.
//  Copyright (c) 2012 Mapion Co.,Ltd. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "MMFoundation.h"

@interface MMOverlay : CAScrollLayer

@property (nonatomic, assign) MMProjectedPoint projectedLocation;

- (void)setPosition:(CGPoint)position animated:(BOOL)animated;

@end
