//
//  OxICClassWrapperFactoryObject.h
//  OXENIPHONECOMMONS
//
//  Created by Lautaro Brasseur on 03/08/11.
//  Copyright 2011 Oxen Software Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OxICFactoryObject.h"
#import "OxICClassWrapper.h"
#import "OxICObjectDefinition.h"
#import "OxICContainer.h"

@interface OxICDefaultFactoryObject : NSObject<OxICFactoryObject> {
	id<OxICClassWrapper> classWrapper;
	OxICObjectDefinition* definition;
	OxICContainer* container;
}

- (id) initWithClassWrapper:(id<OxICClassWrapper>) aClassWrapper
			  andDefinition:(OxICObjectDefinition*) aDefinition
			   andContainer: (OxICContainer*) aContainer;

@end
