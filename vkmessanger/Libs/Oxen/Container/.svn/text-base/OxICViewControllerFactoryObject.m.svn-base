//
//  OxICViewControllerFactoryObject.m
//  OxeniPhoneCommons
//
//  Created by Lautaro Brasseur on 11/08/11.
//  Copyright 2011 Oxen Software Studio. All rights reserved.
//

#import "OxICViewControllerFactoryObject.h"
#import <UIKit/UIKit.h>

@implementation OxICViewControllerFactoryObject
@synthesize controllerClass, nibName;

- (void) dealloc {
	self.controllerClass = nil;
	self.nibName = nil;
	[super dealloc];
}


- (id) getObject {
	UIViewController *controller = [objc_getClass([self.controllerClass UTF8String]) alloc];
	return [[controller initWithNibName:self.nibName bundle:nil] autorelease];
}

@end
