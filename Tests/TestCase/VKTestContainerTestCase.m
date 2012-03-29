//
//  Created by Vitaliy Ruzhnikov on 27.03.12.
//
//
//


#import "VKTestContainerTestCase.h"
#import "VKTestContainer.h"


@implementation VKTestContainerTestCase {

@private
    VKTestContainer *_container;
}
@synthesize container = _container;


- (void)setUp {
    [super setUp];
    self.container = [[[VKTestContainer alloc] init] autorelease];
}

- (void)tearDown {
    self.container = nil;
    [super tearDown];
}

@end