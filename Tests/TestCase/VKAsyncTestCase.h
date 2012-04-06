//
//  Created by Vitaliy Ruzhnikov on 27.03.12.
//
//
//


#import <Foundation/Foundation.h>
#import <GHUnitIOS/GHAsyncTestCase.h>

@class VKProductionContainer;
@class VKIntegrationTestContainer;


@interface VKAsyncTestCase : GHAsyncTestCase

@property(nonatomic, retain) VKIntegrationTestContainer *container;


@end