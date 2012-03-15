//
//  OxICThreadLocalProxyFactoryObject.m
//  OxeniPhoneCommons
//
//  Created by Lautaro Brasseur on 10/03/12.
//  Copyright 2012 Oxen Software Studio. All rights reserved.
//

#import "OxICThreadLocalProxyFactoryObject.h"
#import "OxICThreadLocalProxy.h"

@implementation OxICThreadLocalProxyFactoryObject
@synthesize factoryObject;
@synthesize name;

- (id) getObject {
	OxICThreadLocalProxyFactoryObject *proxy = [[OxICThreadLocalProxy alloc] initWithFactoryObject:self.factoryObject
																						   andName:self.name];
	return [proxy autorelease];
}

@end
