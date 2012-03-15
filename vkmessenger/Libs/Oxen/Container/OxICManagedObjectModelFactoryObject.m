//
//  OxICManagedObjectModelFactoryObject.m
//  OXENIPHONECOMMONS
//
//  Created by Lautaro Brasseur on 04/08/11.
//  Copyright 2011 Oxen Software Studio. All rights reserved.
//

#import "OxICManagedObjectModelFactoryObject.h"
#import <CoreData/CoreData.h>

@implementation OxICManagedObjectModelFactoryObject

- (id) getObject {
	return [NSManagedObjectModel mergedModelFromBundles:nil];
}

@end
