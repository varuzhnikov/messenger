//
//  OxICNibFactoryObject.h
//  OXENIPHONECOMMONS
//
//  Created by Lautaro Brasseur on 03/08/11.
//  Copyright 2011 Oxen Software Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OxICFactoryObject.h"

@interface OxICNibFactoryObject : NSObject<OxICFactoryObject> {
	NSString* name;
	id owner;
}

@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) id owner;

@end
