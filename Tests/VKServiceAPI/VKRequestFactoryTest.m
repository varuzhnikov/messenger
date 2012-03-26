//
//  Created by Vitaliy Ruzhnikov on 18.03.12.
//
//
//


#import "VKRequestFactoryTest.h"
#import "VKRequestFactoryImpl.h"
#import "VKRequest.h"
#import "VKRequestFactory.h"


@implementation VKRequestFactoryTest {

}

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_Should_Create_VK_Login_Request {
    id<VKRequestFactory> factory = [[VKRequestFactoryImpl alloc] init];
    VKRequest* request = [factory createLoginRequestWithUsername:@"test_username" andPasword:@"test_password"];

    STAssertNotNil(request, @"should create vk login request");

    [factory release];
}


@end