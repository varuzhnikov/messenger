//
//  Created by Vitaliy Ruzhnikov on 27.03.12.
//
//
//


#import "VKAsyncTestCase.h"
#import "VKTestContainer.h"
#import "VKProductionContainer.h"


@implementation VKAsyncTestCase {

@private
    VKProductionContainer *_container;
}
@synthesize container = _container;


- (void)setUp {
    [super setUp];
    self.container = [[[VKProductionContainer alloc] init] autorelease];
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