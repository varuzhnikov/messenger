//
//  Created by Vitaliy Ruzhnikov on 16.03.12.
//
//
//


#import <objc/runtime.h>
#import "VKTestContainer.h"
#import "OxICSimpleWrapperFactory.h"


@implementation VKTestContainer {

}
- (id)init {
    self = [super initWithWrapperFactory:[[[OxICSimpleWrapperFactory alloc] init] autorelease]];
    if (self) {
        [self addDefinitionFromClassName:@"VKServiceAPIStub"];
        [self addDefinitionFromClassName:@"VKAuthenticator"];
        [self addDefinitionFromClassName:@"VKRequestFactoryImpl"];

        //TODO: NSLog(@"Class name: %@", [NSObject class]);
        // if no, then use class_getName([NSObject class]);
    }

    return self;
}


@end