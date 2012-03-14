//
//  OxICThreadLocalProxyFactoryObject.h
//  OxeniPhoneCommons
//
//  Created by Lautaro Brasseur on 10/03/12.
//  Copyright 2012 Oxen Software Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OxICFactoryObject.h"

@interface OxICThreadLocalProxyFactoryObject : NSObject<OxICFactoryObject> {
	id<OxICFactoryObject> factoryObject;
	NSString *name;
}

@property (retain, nonatomic) id<OxICFactoryObject> factoryObject;
@property (retain, nonatomic) NSString *name;

@end
