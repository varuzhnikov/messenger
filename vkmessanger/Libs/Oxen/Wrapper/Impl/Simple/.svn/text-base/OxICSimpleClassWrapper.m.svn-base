//
//  OxICSimpleClassWrapper.m
//  OxeniPhoneCommons
//
//  Created by Lautaro Brasseur on 18/07/10.
//  Copyright 2010 Oxen Software Studio. All rights reserved.
//

#import "OxICSimpleClassWrapper.h"
#import <objc/runtime.h>

@interface OxICSimpleClassWrapper()
@property (nonatomic, retain) Class type;
- (OxICPropertyDescriptor*) buildPropertyDescriptor: (objc_property_t) theProperty withName:(NSString*) propertyName;
@end


@implementation OxICSimpleClassWrapper
@synthesize type;

#pragma mark Init and dealloc
- (id) initWithClass:(Class) aType {
	if (self = [super init]) {
		self.type = aType;
	}
	
	return self;
}

- (id) initWithClassName:(NSString*) aClassName {
	self = [self initWithClass:objc_getClass([aClassName UTF8String])];
	return self;
}

- (void) dealloc {
	self.type = nil;
	[super dealloc];
}

#pragma mark OxICClassWrapper methods
- (NSArray*) getPropertyDescriptors {
	NSMutableArray *propArray = [[NSMutableArray alloc] init];
	
	unsigned int outCount, i;
	objc_property_t *properties = class_copyPropertyList(self.type, &outCount);
	for (i = 0; i < outCount; i++) {
		objc_property_t property = properties[i];
		[propArray addObject:[self buildPropertyDescriptor:property
												  withName:[NSString stringWithCString:property_getName(property)
																			  encoding:NSUTF8StringEncoding]
							  ]
		];
	}

	return [propArray autorelease];
}

- (OxICPropertyDescriptor*) getPropertyDescriptor: (NSString*) propertyName {
	objc_property_t theProperty = class_getProperty(self.type, [propertyName UTF8String]);
	if (theProperty == nil) {
		[NSException raise:@"NoSuchPropertyException" format:@"Property %@ not found", propertyName];
	}
	
	return [self buildPropertyDescriptor:theProperty withName:propertyName];
}

- (BOOL) hasProperty:(NSString*) propertyName {
	return class_getProperty(self.type, [propertyName UTF8String]) != nil;
}

- (id) newObject {
	return [self.type new];
}

- (id) allocObject {
	return [self.type alloc];
}

- (BOOL) conformsToProtocol: (Protocol*) protocol {
	return class_conformsToProtocol(self.type, protocol);
}

#pragma mark Private methods
- (OxICPropertyDescriptor*) buildPropertyDescriptor: (objc_property_t) theProperty withName:(NSString*) propertyName {
	NSString *typeInfo = [NSString stringWithCString:property_getAttributes(theProperty) encoding:NSUTF8StringEncoding];
	
	Class targetType = [NSObject class];
	Protocol *targetProtocol = nil;
	
	NSInteger firstPos = [typeInfo rangeOfString:@"\""].location + 1;
	if (firstPos > 0) {
		NSInteger charCount = [[typeInfo substringFromIndex:firstPos] rangeOfString:@"\""].location;
		NSString *typeName = [typeInfo substringWithRange: NSMakeRange(firstPos, charCount)];
		if ([typeName hasPrefix:@"<"] && [typeName hasSuffix:@">"] ){
			typeName = [typeName substringWithRange:NSMakeRange(1, [typeName length] - 2)];
			targetProtocol = objc_getProtocol([typeName UTF8String]);
		} else {
			targetType = objc_getClass([typeName UTF8String]);
		}
	}

	
	return [[[OxICPropertyDescriptor alloc] initWithName:propertyName
												 andType:targetType
											 andProtocol:targetProtocol] autorelease];
}

@end
