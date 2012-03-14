//
//  ExampleServiceImpl.m
//  Otra
//
//  Created by Facundo Fumaneri on 12/27/10.
//  Copyright 2010 Oxen. All rights reserved.
//

#import "ExampleServiceImpl.h"
#import "OxICContainer.h"


@implementation ExampleServiceImpl

IoCName(theService)
IoCSingleton
IoCLazy

-(void) execute {
	NSLog(@"Service Implementation");
}
@end
