//
//  Created by Vitaliy Ruzhnikov on 02.04.12.
//
//
//


#import "VKContainer.h"
#import "VKErrorNotifierImpl.h"
#import "VKLoginViewController.h"
#import "VKLoginScreen.h"
#import "VKRequestFactoryImpl.h"
#import "VKAsyncRequestSender.h"
#import "VKAuthenticator.h"
#import "OxICSimpleWrapperFactory.h"
#import "VKTokenInjectorRequestSenderDecorator.h"
#import "VKContactsRetriever.h"


@implementation VKContainer {

}

- (id)init {
    self = [super initWithWrapperFactory:[[[OxICSimpleWrapperFactory alloc] init] autorelease]];
    if (self) {
        [self addDefinitionFromClassName:NSStringFromClass([VKAuthenticator class])];
        [self addDefinitionFromClassName:NSStringFromClass([VKRequestFactoryImpl class])];
        [self addDefinitionFromClassName:NSStringFromClass([VKLoginScreen class])];
        [self addDefinitionFromClassName:NSStringFromClass([VKLoginViewController class])];
        [self addDefinitionFromClassName:NSStringFromClass([VKErrorNotifierImpl class])];
        [self addDefinitionFromClassName:NSStringFromClass([VKTokenInjectorRequestSenderDecorator class])];
        [self addDefinitionFromClassName:NSStringFromClass([VKContactsRetriever class])];
    }

    return self;
}


@end