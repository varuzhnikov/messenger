//
//  OxICObjectDefinition.h
//  Otra
//
//  Created by Lautaro Brasseur on 28/03/10.
//  Copyright 2010 Oxen Software Studio. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface OxICObjectDefinition : NSObject {
	NSString *name;
	NSString *className;
	BOOL singleton;
	BOOL lazy;
	NSMutableDictionary *propertyReferences;
	NSMutableDictionary *propertyValues;
}

@property (retain,nonatomic) NSString *name;
@property (retain,nonatomic) NSString *className;
@property (assign,nonatomic) BOOL singleton;
@property (assign,nonatomic) BOOL lazy;
@property (assign,nonatomic,readonly) NSDictionary *propertyReferences;
@property (assign,nonatomic,readonly) NSDictionary *propertyValues;

+ (OxICObjectDefinition*) withName: (NSString*) name
						  andClass: (NSString*) className
					  andSingleton: (BOOL) singleton
						   andLazy: (BOOL) lazy
					 andReferences: (NSDictionary*) propertyReferences
						 andValues: (NSDictionary*) propertyValues;

- (void) addPropertyReference:(NSString*) propertyName toObjectName:(NSString*) objectName;
- (void) addPropertyValue:(NSString*) propertyName toValue:(id) value;

@end
