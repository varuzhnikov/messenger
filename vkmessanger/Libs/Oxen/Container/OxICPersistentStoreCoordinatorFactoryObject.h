//
//  OxICPersistentStoreCoordinatorFactoryObject.h
//  OXENIPHONECOMMONS
//
//  Created by Lautaro Brasseur on 04/08/11.
//  Copyright 2011 Oxen Software Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OxICFactoryObject.h"
#import <CoreData/CoreData.h>

@interface OxICPersistentStoreCoordinatorFactoryObject : NSObject<OxICFactoryObject> {
	NSURL* storeUrl;
	NSManagedObjectModel* managedObjectModel;
}

@property (nonatomic, retain) NSURL* storeUrl;
@property (nonatomic, retain) NSManagedObjectModel* managedObjectModel;

@end
