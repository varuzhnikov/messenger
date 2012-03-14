//
//  OxICClassWrapperFactoryObject.m
//  OXENIPHONECOMMONS
//
//  Created by Lautaro Brasseur on 03/08/11.
//  Copyright 2011 Oxen Software Studio. All rights reserved.
//

#import "OxICDefaultFactoryObject.h"

@interface OxICDefaultFactoryObject()
@property (nonatomic, retain) id<OxICClassWrapper> classWrapper;
@property (nonatomic, retain) OxICObjectDefinition* definition;
@property (nonatomic, retain) OxICContainer* container;
@end


@implementation OxICDefaultFactoryObject
@synthesize classWrapper;
@synthesize definition;
@synthesize container;

- (id) initWithClassWrapper:(id<OxICClassWrapper>) aClassWrapper
			  andDefinition:(OxICObjectDefinition*) aDefinition
			   andContainer: (OxICContainer*) aContainer {
	self = [super init];
	if (self != nil) {
		self.classWrapper = aClassWrapper;
		self.definition = aDefinition;
		self.container = aContainer;
	}
	return self;
}

- (void) dealloc {
	self.classWrapper = nil;
	self.definition = nil;
	self.container = nil;
	[super dealloc];
}

- (id) getObject {
	id object = [self.classWrapper newObject];
	
	[self.container injectObject:object withDefinition:self.definition];

	return [object autorelease];
}


@end
