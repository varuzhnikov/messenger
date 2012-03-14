//
//  OxICSimpleWrapperFactory.m
//  OxeniPhoneCommons
//
//  Created by Lautaro Brasseur on 19/07/10.
//  Copyright 2010 Oxen Software Studio. All rights reserved.
//

#import "OxICSimpleWrapperFactory.h"
#import "OxICSimpleObjectWrapper.h"

@implementation OxICSimpleWrapperFactory
- (id<OxICClassWrapper>) wrapClass: (NSString*)className {
	return [[[OxICSimpleClassWrapper alloc] initWithClassName:className] autorelease];
}

- (id<OxICObjectWrapper>) wrapObject: (id) object {
	return [[[OxICSimpleObjectWrapper alloc] initWithObject:object] autorelease];
}

- (id<OxICObjectWrapper>) createAndWrapObject: (NSString*)className {
	return [[[OxICSimpleObjectWrapper alloc] initWithClassName:className] autorelease];
}

@end
