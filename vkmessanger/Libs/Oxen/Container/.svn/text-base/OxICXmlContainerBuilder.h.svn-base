//
//  OxICXmlContainerBuilder.h
//  Otra
//
//  Created by Lautaro Brasseur on 09/05/10.
//  Copyright 2010 Oxen Software Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OxICContainer.h"
#import "OxICObjectDefinition.h"
#import <libxml/tree.h>
#import "OxICContainerBuilderDelegate.h"
#import "OxICWrapperFactory.h"

@interface OxICXmlContainerBuilder : NSObject {
	xmlParserCtxtPtr context;
	OxICContainer *container;
	OxICObjectDefinition *objectDefinition;
	NSURLConnection *connection;
	
	id<OxICContainerBuilderDelegate> delegate;
}

- (void) buildContainer: (NSURL*) xmlUrl
		   withDelegate: (id<OxICContainerBuilderDelegate>) aDelegate
	  andWrapperFactory:(id<OxICWrapperFactory>)wrapperFactory;

@end
