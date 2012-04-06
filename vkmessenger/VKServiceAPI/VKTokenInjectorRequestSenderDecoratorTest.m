//
//  Created by Vitaliy Ruzhnikov on 02.04.12.
//
//
//


#import "VKTokenInjectorRequestSenderDecoratorTest.h"
#import "VKRequest.h"
#import "VKLoginRequest.h"
#import "VKTokenInjectorRequestSenderDecorator.h"
#import "VKContactsRequest.h"


@implementation VKTokenInjectorRequestSenderDecoratorTest {

@private
    VKRequest *_request;
    NSString *_token;
    VKTokenInjectorRequestSenderDecorator *_decorator;
}
@synthesize request = _request;
@synthesize token = _token;
@synthesize decorator = _decorator;


- (void)setUp {
    [super setUp];
    _decorator = [[VKTokenInjectorRequestSenderDecorator alloc] initWithDelegate:self];
}


- (void)tearDown {
    self.decorator = nil;
    self.request = nil;
    [super tearDown];

}


- (void)test_Should_Send_Request {
    [self.decorator sendRequest:[[[VKContactsRequest alloc] init] autorelease]];

    STAssertNotNil(self.request, @"should send request");
}

- (void)test_Should_Send_Request_Without_Token_Param_If_Token_Is_Empty {
    [self.decorator sendRequest:[[[VKContactsRequest alloc] init] autorelease]];

    STAssertNil([self.request getParameterWithName:TOKEN_PARAM_NAME], @"should send request without token param if token is empty");
}

- (void)test_Should_Send_Request_With_Token_Param_If_Token_Is_Present {
    self.token = TEST_TOKEN;
    [self.decorator sendRequest:[[[VKContactsRequest alloc] init] autorelease]];

    STAssertEqualObjects([self.request getParameterWithName:TOKEN_PARAM_NAME], TEST_TOKEN, @"should send request with token param if present");
}

- (void)sendRequest:(VKRequest *)request {
    self.request = request;
}

@end