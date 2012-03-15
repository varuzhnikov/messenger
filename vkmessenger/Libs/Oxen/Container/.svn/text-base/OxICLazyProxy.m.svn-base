//
//  OxICLazyProxy.m
//  Otra
//
//  Created by Lautaro Brasseur on 07/05/10.
//  Copyright 2010 Oxen Software Studio. All rights reserved.
//

#import "OxICLazyProxy.h"


@interface OxICLazyProxy()
@property (retain, nonatomic) id realObject;
@property (retain, nonatomic) id<OxICFactoryObject> factoryObject;

- (void) buildRealObjectIfNull;
@end

@implementation OxICLazyProxy
@synthesize realObject, factoryObject;

#pragma mark Init and dealloc methods
- (id) initWithFactoryObject: (id<OxICFactoryObject>) aFactoryObject {
	self.realObject = nil;
	self.factoryObject = aFactoryObject;
	return self;
}

- (void) dealloc {
	self.realObject = nil;
	self.factoryObject = nil;
	[super dealloc];
}

#pragma mark NSProxy methods
- (void)forwardInvocation:(NSInvocation *)anInvocation {
	[self buildRealObjectIfNull];
    [anInvocation setTarget:self.realObject];
    [anInvocation invoke];
    return;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
	[self buildRealObjectIfNull];
    return [self.realObject methodSignatureForSelector:aSelector];
}

#pragma mark Private methods
- (void) buildRealObjectIfNull {
	if (self.realObject == nil) {
		self.realObject = [self.factoryObject getObject];
		self.factoryObject = nil;
	}
}

@end

