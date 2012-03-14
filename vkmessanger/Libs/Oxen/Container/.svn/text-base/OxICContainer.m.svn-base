//
//  OxICContainer.m
//  Otra
//
//  Created by Lautaro Brasseur on 28/03/10.
//  Copyright 2010 Oxen Software Studio. All rights reserved.
//

#import "OxICContainer.h"
#import "OxICObjectWrapper.h"
#import "OxICLazyProxy.h"
#import "OxICPropertyDescriptor.h"
#import "OxICFactoryObject.h"
#import "OxICDefaultFactoryObject.h"
#import <objc/runtime.h>

@interface OxICContainer()
@property (nonatomic, retain) id<OxICWrapperFactory> wrapperFactory;
@property (nonatomic, retain) NSMutableDictionary *definitions;
@property (nonatomic, retain) NSMutableDictionary *singletons;

- (id) getObjectForDefinition: (OxICObjectDefinition*) definition;
- (id) buildObject: (OxICObjectDefinition*) definition;
- (OxICObjectDefinition*) getObjectDefinitionFromClassName:(NSString*) className;
- (void) addPropertyReferencesInDefinition:(OxICObjectDefinition *) definition;
- (id<OxICFactoryObject>) getFactoryForDefinition:(OxICObjectDefinition *) definition;
@end

@implementation OxICContainer
@synthesize wrapperFactory,singletons,definitions;

#pragma mark Init and dealloc
- (id) initWithWrapperFactory: (id<OxICWrapperFactory>) aWrapperFactory {
	if (self = [super init]) {
		self.wrapperFactory = aWrapperFactory;
		
		NSMutableDictionary *aDefinitions = [[NSMutableDictionary alloc] init];
		self.definitions = aDefinitions;
		[aDefinitions release];
		
		NSMutableDictionary *aSingletons = [[NSMutableDictionary alloc] init];
		self.singletons = aSingletons;
		[aSingletons release];
	}
	return self;
}

- (void) dealloc {
	self.wrapperFactory = nil;
	self.definitions = nil;
	self.singletons = nil;
	[super dealloc];
}

#pragma mark public methods
- (void) addDefinition: (OxICObjectDefinition*) definition {
	[self.definitions setObject:definition forKey:definition.name];
}

- (void) addDefinitionFromClassName: (NSString*) className {
	OxICObjectDefinition *definition = [self getObjectDefinitionFromClassName:className];
	[self addDefinition:definition];
	
}

- (id) getObject: (NSString*) name {
	/* check the singleton pool first */
	id object = [self.singletons objectForKey:name];
	
	if (object == nil) {
		OxICObjectDefinition *definition = [self.definitions objectForKey:name];
		
		if (definition != nil) {
			object = [self getObjectForDefinition:definition];
		}
	}
	
	return object;
}

- (void) injectObject: (id) object withDefinition:(OxICObjectDefinition*) definition {
	id<OxICObjectWrapper> wrapper = [self.wrapperFactory wrapObject:object];
	
	for (NSString *propName in [definition.propertyReferences allKeys]) {
		NSString *reference = [definition.propertyReferences objectForKey:propName];
		id object;
		
		if ([wrapper hasProperty:propName] &&
			protocol_isEqual([[wrapper getPropertyDescriptor:propName] protocol], @protocol(OxICFactoryObject))) {
			/* Inject the factory - just like Guice's Provider Injections! */
			object = [self getFactoryForDefinition:[self.definitions objectForKey:reference]];
		} else {
			object = [self getObject:reference];
		}

		[wrapper setProperty:propName withValue:object];
	}
	for (NSString *propName in [definition.propertyValues allKeys]) {
		id object = [definition.propertyValues objectForKey:propName];
		[wrapper setProperty:propName withValue:object];
	}
}


#pragma mark private methods
- (id) getObjectForDefinition: (OxICObjectDefinition*) definition {
	id object;
	
	if (definition.singleton) {
		object = [self.singletons objectForKey:definition.name];
	} else {
		object = nil;
	}
	
	if (object == nil) {
		object = [self buildObject:definition];
		if (definition.singleton) {
			[self.singletons setObject:object forKey:definition.name];
			/* Remove the definition, releasing memory */
			[self.definitions removeObjectForKey:definition.name];
		}
	}
	
	return object;
}

- (id) buildObject: (OxICObjectDefinition*) definition {
	[self addPropertyReferencesInDefinition:definition];
	
	id<OxICFactoryObject> factoryObject = [self getFactoryForDefinition:definition];
	
	if (!definition.lazy) {
		return [factoryObject getObject];
	} else {
		id lazyProxy = [[OxICLazyProxy alloc] initWithFactoryObject:factoryObject];
		return [lazyProxy autorelease];
	}
	
}

-(void) addPropertyReferencesInDefinition:(OxICObjectDefinition *) definition {
	int i=0;
	unsigned int mc = 0;
	Method * mlist = class_copyMethodList(objc_getClass([definition.className UTF8String]), &mc);
	NSString *methodName;
	NSString *propertyName;
	NSString *objectDefName;
	for(i=0;i<mc;i++){
		methodName = [NSString stringWithUTF8String:sel_getName(method_getName(mlist[i]))];
		NSRange iocMapRange = [methodName rangeOfString:@"iocMap_"];
		if (iocMapRange.location == 0) {
			NSRange $$location = [methodName rangeOfString:@"__"];
			propertyName = [methodName substringWithRange: NSMakeRange (iocMapRange.length, $$location.location - iocMapRange.length)];
			objectDefName = [methodName substringWithRange:NSMakeRange($$location.location + $$location.length, [methodName length] - $$location.location - $$location.length)];
			[definition addPropertyReference:propertyName toObjectName:objectDefName];
		}
	}
	free(mlist);
}
- (OxICObjectDefinition*) getObjectDefinitionFromClassName:(NSString*) className {
	unsigned int mc = 0;
	Method * mlist = class_copyMethodList(objc_getClass([className UTF8String]), &mc);
	NSString *methodName;
	NSString *defName = nil;
	BOOL defLazy = NO;
	BOOL defSingleton = NO;
	int i;
	for(i=0;i<mc;i++){
		methodName = [NSString stringWithUTF8String:sel_getName(method_getName(mlist[i]))];
		NSRange iocNameRange = [methodName rangeOfString:@"iocName_"];
		if (iocNameRange.location == 0) {
			defName = [methodName substringWithRange: NSMakeRange (iocNameRange.length, [methodName length] - iocNameRange.length)];
		} else if ([methodName isEqualToString:@"iocLazy"]) {
			defLazy = YES;
		} else if ([methodName isEqualToString:@"iocSingleton"]) {
			defSingleton = YES;
		}
	}
	free(mlist);
	
	OxICObjectDefinition *objectDefinition = [[OxICObjectDefinition alloc] init];
	if (!defName) {
		defName = className;
	}
	objectDefinition.name = defName;
	objectDefinition.className = className;
	objectDefinition.lazy = defLazy;
	objectDefinition.singleton = defSingleton;
	
	[self addPropertyReferencesInDefinition:objectDefinition];
	
	return [objectDefinition autorelease];
}

- (id<OxICFactoryObject>) getFactoryForDefinition:(OxICObjectDefinition *) definition {
	id<OxICClassWrapper> classWrapper = [self.wrapperFactory wrapClass:definition.className];
	
	if ([classWrapper conformsToProtocol:@protocol(OxICFactoryObject)]) {
		id<OxICFactoryObject> customFactory = [[classWrapper newObject] autorelease];
		
		[self injectObject:customFactory withDefinition:definition];
		
		return customFactory;
	} else {
		return [[[OxICDefaultFactoryObject alloc] initWithClassWrapper: classWrapper
														 andDefinition:definition
														  andContainer:self] autorelease];
	}
}

@end
