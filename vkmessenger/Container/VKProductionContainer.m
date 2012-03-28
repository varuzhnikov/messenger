//
//  Created by Vitaliy Ruzhnikov on 27.03.12.
//
//
//


#import "VKProductionContainer.h"
#import "VKServiceAPIImpl.h"
#import "VKAuthenticator.h"
#import "VKRequestFactoryImpl.h"
#import "OxICSimpleWrapperFactory.h"


@implementation VKProductionContainer {

}
- (id)init {
    self = [super initWithWrapperFactory:[[[OxICSimpleWrapperFactory alloc] init] autorelease]];
    if (self) {
        [self addDefinitionFromClassName:NSStringFromClass([VKAuthenticator class])];
        [self addDefinitionFromClassName:NSStringFromClass([VKServiceAPIImpl class])];
        [self addDefinitionFromClassName:NSStringFromClass([VKRequestFactoryImpl class])];
    }

    return self;
}


@end