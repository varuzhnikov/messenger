//
//  OxICLazyProxyFactoryObject.m
//  OxeniPhoneCommons
//
//  Created by Lautaro Brasseur on 10/03/12.
//  Copyright 2012 Oxen Software Studio. All rights reserved.
//

#import "OxICLazyProxyFactoryObject.h"
#import "OxICLazyProxy.h"

@implementation OxICLazyProxyFactoryObject
@synthesize factoryObject;

- (id) getObject {
	OxICLazyProxy *proxy = [[OxICLazyProxy alloc] initWithFactoryObject:self.factoryObject];
	return [proxy autorelease];
}

@end
