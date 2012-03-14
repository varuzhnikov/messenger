//
//  ServiceExecutorImpl.m
//  Otra
//
//  Created by Facundo Fumaneri on 12/27/10.
//  Copyright 2010 Oxen. All rights reserved.
//

#import "ServiceExecutorImpl.h"
#import "OxICContainer.h"

@implementation ServiceExecutorImpl
@synthesize service;

//Inject theService object to service property
IoCName(theExecutor)
IoCInject(service, theService)
IoCLazy

- (void) executeService {
	[service execute];
}
@end
