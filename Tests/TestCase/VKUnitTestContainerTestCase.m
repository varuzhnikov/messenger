//
//  Created by Vitaliy Ruzhnikov on 27.03.12.
//
//
//


#import "VKUnitTestContainerTestCase.h"
#import "VKUnitTestContainer.h"


@implementation VKUnitTestContainerTestCase {

@private
    VKUnitTestContainer *_container;
}
@synthesize container = _container;


- (void)setUp {
    [super setUp];
    self.container = [[[VKUnitTestContainer alloc] init] autorelease];
}

- (void)tearDown {
    self.container = nil;
    [super tearDown];
}

@end