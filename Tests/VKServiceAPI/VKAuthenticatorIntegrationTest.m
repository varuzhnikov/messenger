//
//  Created by Vitaliy Ruzhnikov on 12.03.12.
//
//
//


#import "VKAuthenticatorIntegrationTest.h"
#import "ASIHTTPRequest.h"
#import "VKServiceAPIImpl.h"
#import "VKLoginRequest.h"
#import "VKAuthenticator.h"
#import "OxICContainer.h"
#import "VKProductionContainer.h"
#import "VKServiceAPI.h"


@implementation VKAuthenticatorIntegrationTest {

}

- (void)setUp {
    [super setUp];
    _authenticator = [self.container getObject:@"authenticator"];
    _serviceAPI = [self.container getObject:@"serviceAPI"];
}

- (void)tearDown {
    [super tearDown];
    [_request release];
}

- (void)test_Should_Get_Access_Token_From_Server {
    _authenticator.delegate = self;
    [_authenticator loginWithUsername:@"denis.tarazanov@gmail.com" andPassword:@"_Gu^iL@D"];
}

- (void)loginFinished {
    NSLog(@"Login finished");
    loginFinished = YES;
    NSLog(@"serviceAPI token %@, ", _serviceAPI.token);
    GHAssertTrue(_serviceAPI.token.length > 0, @"should get nonempty token from server");
}

@end