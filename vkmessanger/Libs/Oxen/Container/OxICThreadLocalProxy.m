//
//  OxICThreadLocalProxy.m
//  OxeniPhoneCommons
//
//  Created by Lautaro Brasseur on 10/03/12.
//  Copyright 2012 Oxen Software Studio. All rights reserved.
//

#import "OxICThreadLocalProxy.h"

@interface OxICThreadLocalProxy()
@property (assign, nonatomic, readonly) id realObject;
@property (retain, nonatomic) id<OxICFactoryObject> factoryObject;
@property (retain, nonatomic) NSString *name;
@end

@implementation OxICThreadLocalProxy

@synthesize factoryObject;
@synthesize name;

#pragma mark Init and dealloc methods
- (id) initWithFactoryObject: (id<OxICFactoryObject>) aFactoryObject
					 andName:(NSString*)aName {
	self.factoryObject = aFactoryObject;
	self.name = aName;
	return self;
}

- (void) dealloc {
	self.factoryObject = nil;
	self.name = nil;
	[super dealloc];
}

#pragma mark NSProxy methods
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    [anInvocation setTarget:self.realObject];
    [anInvocation invoke];
    return;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    return [self.realObject methodSignatureForSelector:aSelector];
}

#pragma mark Private methods
- (id) realObject {
	NSMutableDictionary *dict = [[NSThread currentThread] threadDictionary];
	id realObject = [dict objectForKey:self.name];
	if (realObject == nil) {
		realObject = [self.factoryObject getObject];
		[dict  setObject:realObject
				  forKey:self.name];
	}
	
	return realObject;
}	

@end
