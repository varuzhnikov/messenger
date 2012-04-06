//
//  Created by Vitaliy Ruzhnikov on 27.03.12.
//
//
//


#import "VKAsyncTestCase.h"
#import "VKProductionContainer.h"
#import "VKIntegrationTestContainer.h"


@implementation VKAsyncTestCase {

@private
    VKIntegrationTestContainer *_container;
}
@synthesize container = _container;


- (void)setUp {
    [super setUp];
    self.container = [[[VKIntegrationTestContainer alloc] init] autorelease];
}

- (void)tearDown {
    self.container = nil;
    [super tearDown];
}

- (void)dealloc {
    [_container release];
    [super dealloc];
}

@end