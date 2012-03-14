//
//  OxICObjectDefinition.m
//  Otra
//
//  Created by Lautaro Brasseur on 28/03/10.
//  Copyright 2010 Oxen Software Studio. All rights reserved.
//

#import "OxICObjectDefinition.h"


@implementation OxICObjectDefinition
@synthesize name, className, singleton, lazy, propertyReferences, propertyValues;

#pragma mark public methods
+ (OxICObjectDefinition*) withName: (NSString*) name
						  andClass: (NSString*) className
					  andSingleton: (BOOL) singleton
						   andLazy: (BOOL) lazy
					 andReferences: (NSDictionary*) propertyReferences
						 andValues: (NSDictionary*) propertyValues {

	OxICObjectDefinition *definition = [[OxICObjectDefinition alloc] init];
	definition.name = name;
	definition.className = className;
	definition.singleton = singleton;
	definition.lazy = lazy;
	
	if (propertyReferences != nil) {
		NSMutableDictionary *propRef = (NSMutableDictionary*)definition.propertyReferences;
		[propRef addEntriesFromDictionary:propertyReferences];
	}
	
	if (propertyValues != nil) {
		NSMutableDictionary *propVal = (NSMutableDictionary*)definition.propertyValues;
		[propVal addEntriesFromDictionary:propertyValues];
	}
	
	return [definition autorelease];
}


- (void) addPropertyReference:(NSString*) propertyName toObjectName:(NSString*) objectName {
	[propertyReferences setObject:objectName forKey:propertyName];
}

- (void) addPropertyValue:(NSString*) propertyName toValue:(id) value {
	[propertyValues setObject:value forKey:propertyName];
}

#pragma mark init and dealloc
- (id) init
{
	self = [super init];
	if (self != nil) {
		propertyReferences = [[NSMutableDictionary alloc] init];
		propertyValues = [[NSMutableDictionary alloc] init];
		self.singleton = YES;
		self.lazy = NO;
	}
	return self;
}


- (void) dealloc {
	self.name = nil;
	self.className = nil;
	[propertyReferences release];
	[propertyValues release];
	[super dealloc];
}

@end
