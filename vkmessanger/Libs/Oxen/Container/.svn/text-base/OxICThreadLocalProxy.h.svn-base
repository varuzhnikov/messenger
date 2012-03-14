//
//  OxICThreadLocalProxy.h
//  OxeniPhoneCommons
//
//  Created by Lautaro Brasseur on 10/03/12.
//  Copyright 2012 Oxen Software Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OxICFactoryObject.h"


@interface OxICThreadLocalProxy : NSProxy {
	id<OxICFactoryObject> factoryObject;
	NSString *name;
}

- (id) initWithFactoryObject: (id<OxICFactoryObject>) aFactoryObject
					 andName:(NSString*)aName;

@end
