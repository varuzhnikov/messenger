//
//  Created by Vitaliy Ruzhnikov on 16.03.12.
//
//
//


#import <objc/runtime.h>
#import "VKTestContainer.h"
#import "OxICSimpleWrapperFactory.h"
#import "VKAuthenticator.h"
#import "VKRequestFactoryImpl.h"
#import "VKServiceAPIStub.h"
#import "VKLoginScreen.h"


@implementation VKTestContainer {

}
- (id)init {
    self = [super initWithWrapperFactory:[[[OxICSimpleWrapperFactory alloc] init] autorelease]];
    if (self) {
        [self addDefinitionFromClassName:NSStringFromClass([VKServiceAPIStub class])];
        [self addDefinitionFromClassName:NSStringFromClass([VKAuthenticator class])];
        [self addDefinitionFromClassName:NSStringFromClass([VKRequestFactoryImpl class])];
        [self addDefinitionFromClassName:NSStringFromClass([VKLoginScreen class])];
    }

    return self;
}




@end