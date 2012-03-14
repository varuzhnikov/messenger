//
//  OxICContainer.h
//  Otra
//
//  Created by Lautaro Brasseur on 28/03/10.
//  Copyright 2010 Oxen Software Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OxICObjectDefinition.h"
#import "OxICWrapperFactory.h"

#define IoCName(name) -(void) iocName_##name{}
#define IoCLazy -(void) iocLazy{}
#define IoCSingleton -(void) iocSingleton{}
#define IoCInject(property,objectName) -(void) iocMap_##property##__##objectName{}

@interface OxICContainer : NSObject {
	NSMutableDictionary *definitions;
	NSMutableDictionary *singletons;
	id<OxICWrapperFactory> wrapperFactory;
}

- (id) initWithWrapperFactory: (id<OxICWrapperFactory>) aWrapperFactory;

- (void) addDefinition: (OxICObjectDefinition*) definition;
- (void) addDefinitionFromClassName: (NSString*) className;
- (id) getObject: (NSString*) name;
- (void) injectObject: (id) object withDefinition:(OxICObjectDefinition*) definition;

@end
