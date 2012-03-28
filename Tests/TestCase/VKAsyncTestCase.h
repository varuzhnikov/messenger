//
//  Created by Vitaliy Ruzhnikov on 27.03.12.
//
//
//


#import <Foundation/Foundation.h>
#import <GHUnitIOS/GHAsyncTestCase.h>

@class VKTestContainer;
@class VKProductionContainer;


@interface VKAsyncTestCase : GHAsyncTestCase

@property(nonatomic, retain) VKProductionContainer *container;


@end