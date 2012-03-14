//
//  OxICLazyProxy.h
//  Otra
//
//  Created by Lautaro Brasseur on 07/05/10.
//  Copyright 2010 Oxen Software Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OxICFactoryObject.h"

@interface OxICLazyProxy : NSProxy {
	id realObject;
	id<OxICFactoryObject> factoryObject;
}

- (id) initWithFactoryObject: (id<OxICFactoryObject>) aFactoryObject;

@end
