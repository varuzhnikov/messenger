//
//  Created by Vitaliy Ruzhnikov on 16.03.12.
//
//
//


#import "VKLoginRequestTest.h"
#import "VKLoginRequest.h"


@implementation VKLoginRequestTest {

}

- (void)setUp {
    [super setUp];
    request = [[VKLoginRequest alloc] init];
}

- (void)test_Should_Create_Login_Request_With_Correct_Url {
    NSString *expectedString = [NSString stringWithFormat:@"%@?scope=messages,friends&grant_type=password&client_secret=wbim5pRU1CHfFpZytzbD&client_id=2848091", GET_TOKEN_URL];
    STAssertEqualObjects([request.url absoluteString], expectedString, @"should create login request with correct url");
}

- (void)test_Should_Create_Login_Request_With_Login_And_Password_Filled_And_All_Other_Params {
    VKLoginRequest *loginRequest = [[[VKLoginRequest alloc] initWithLogin:TEST_LOGIN andPassword:TEST_PASSWORD] autorelease];

    NSString *expectedString = [NSString stringWithFormat:@"%@?%@=%@&scope=messages,friends&grant_type=password&%@=%@&client_secret=wbim5pRU1CHfFpZytzbD&client_id=2848091", GET_TOKEN_URL, @"password", TEST_PASSWORD,
                    USERNAME_PARAM_NAME, TEST_LOGIN
    ];
    STAssertEqualObjects([[loginRequest url] absoluteString], expectedString, @"should create login request with login and password");
}

- (void)test_Should_Parse_Token_From_Response_String {
    request.responseString = @"{\"access_token\":\"token_from_server\"}";

    STAssertEqualObjects(request.token, @"token_from_server", @"should parse token from response string");
}



- (void)tearDown {
    [super tearDown];
    [request release];
}


@end