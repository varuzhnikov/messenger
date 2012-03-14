//
//  OxICContainerBuilderDelegate.h
//  Otra
//
//  Created by Lautaro Brasseur on 09/05/10.
//  Copyright 2010 Oxen Software Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OxICContainer.h"

@protocol OxICContainerBuilderDelegate
- (void) containerBuildingFinished:(OxICContainer*) container;
- (void) containerBuildingError;
@end
