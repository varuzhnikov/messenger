//
//  Created by Vitaliy Ruzhnikov on 28.03.12.
//
//
//


#import "VKProductionContainerTestCase.h"
#import "VKProductionContainer.h"


@implementation VKProductionContainerTestCase {

@private
    VKProductionContainer *_container;
}
@synthesize container = _container;


- (void)setUp {
    [super setUp];
    _container = [[VKProductionContainer alloc] init];
}

- (void)tearDown {
    self.container = nil;
    [super tearDown];
}



@end