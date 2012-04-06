//
//  Created by Vitaliy Ruzhnikov on 16.03.12.
//
//
//


#import <objc/runtime.h>
#import "VKUnitTestContainer.h"
#import "OxICSimpleWrapperFactory.h"
#import "VKAuthenticator.h"
#import "VKRequestFactoryImpl.h"
#import "VKRequestSenderStub.h"
#import "VKLoginScreen.h"
#import "VKErrorNotifierStub.h"
#import "VKContactsRetriever.h"
#import "VKTokenInjectorRequestSenderDecorator.h"


@implementation VKUnitTestContainer {

}
- (id)init {
    self = [super initWithWrapperFactory:[[[OxICSimpleWrapperFactory alloc] init] autorelease]];
    if (self) {
        [self addDefinitionFromClassName:NSStringFromClass([VKRequestSenderStub class])];
        [self addDefinitionFromClassName:NSStringFromClass([VKAuthenticator class])];
        [self addDefinitionFromClassName:NSStringFromClass([VKRequestFactoryImpl class])];
        [self addDefinitionFromClassName:NSStringFromClass([VKLoginScreen class])];
        [self addDefinitionFromClassName:NSStringFromClass([VKErrorNotifierStub class])];
        [self addDefinitionFromClassName:NSStringFromClass([VKContactsRetriever class])];
        [self addDefinitionFromClassName:NSStringFromClass([VKTokenInjectorRequestSenderDecorator class])];
    }

    return self;
}




@end