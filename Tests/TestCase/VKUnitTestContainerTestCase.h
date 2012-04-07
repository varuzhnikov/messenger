//
//  Created by Vitaliy Ruzhnikov on 27.03.12.
//
//
//


#import <Foundation/Foundation.h>
#import <SenTestingKit/SenTestingKit.h>

@class VKUnitTestContainer;


@interface VKUnitTestContainerTestCase : SenTestCase

@property(nonatomic, retain) VKUnitTestContainer *container;


@end