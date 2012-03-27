//
//  Created by Vitaliy Ruzhnikov on 15.03.12.
//
//
//


#import <objc/runtime.h>
#import "VKRequestTest.h"
#import "VKRequest.h"
#import "ASIHTTPRequest.h"
#import "SBJson.h"


@implementation VKRequestTest {

@private
    NSString *_responseString;
}
@synthesize responseString = _responseString;


- (void)setUp {
    [super setUp];
    request = [[VKRequest alloc] initWithUrlString:URL_STRING];
}

- (void)test_Should_Create_Request_With_Url_String {

    STAssertEqualObjects([request.url absoluteString], URL_STRING, @"Should create request with url string");
}

- (void)test_Should_Add_Parameter_In_Get_Manner {
    [request setGetParameterWithName:QUERY_PARAM_NAME andValue:QUERY_PARAM_VALUE];

    NSString *expectedString = [NSString stringWithFormat:@"%@?%@=%@", URL_STRING, QUERY_PARAM_NAME, QUERY_PARAM_VALUE];
    NSLog(@"expected string: %@", expectedString);
    STAssertEqualObjects([request.url absoluteString], expectedString, @"should add parameter in get manner");
}

- (void)test_Should_Add_Parameter_With_Name_And_Value {
    [request setGetParameterWithName:QUERY_PARAM_NAME andValue:QUERY_PARAM_VALUE];

    STAssertEqualObjects([request getParameterWithName:QUERY_PARAM_NAME], QUERY_PARAM_VALUE, @"should add parameter with name and value");
}

- (void)test_Should_Insert_Delimiter_Between_Params {
    [request setGetParameterWithName:QUERY_PARAM_NAME andValue:QUERY_PARAM_VALUE];
    [request setGetParameterWithName:ANOTHER_PARAM_NAME andValue:ANOTHER_PARAM_VALUE];

    NSString *expectedString = [NSString stringWithFormat:@"%@?%@=%@&%@=%@", URL_STRING, ANOTHER_PARAM_NAME, ANOTHER_PARAM_VALUE,
                                                          QUERY_PARAM_NAME, QUERY_PARAM_VALUE
    ];
    NSLog(@"expected string: %@", expectedString);
    STAssertEqualObjects([request.url absoluteString], expectedString, @"should insert delimeter between params");
}

- (void)test_Should_Correct_Encode_Params_Value {
    [request setGetParameterWithName:PARAM_NAME_WITH_WHITE_SPACE andValue:@"param with white space"];

    NSString *expectedString = [NSString stringWithFormat:@"%@?%@=%@", URL_STRING, PARAM_NAME_WITH_WHITE_SPACE, @"param%20with%20white%20space"];
    NSLog(@"expected string: %@", expectedString);
    STAssertEqualObjects([request.url absoluteString], expectedString, @"should correct encode params value");
}

- (void)test_Should_Call_Delegate_After_ASI_Http_Finished_Request {
    [request setDelegate:self];
    [request requestFinished:nil];

    STAssertTrue(requestFinished, @"should call delegate after asi http request finished");
}

- (void)test_Should_Call_Delegate_After_ASI_Http_Failed_Request {
    [request setDelegate:self];
    [request requestFailed:nil];

    STAssertTrue(requestFinished, @"should call delegate after asi http request finished");
}

- (void)test_Should_Get_Response_String_After_Http_Request_Finished {
    [request setDelegate:self];
    [request requestFinished:self];

    STAssertEqualObjects(request.responseString, [self responseString], @"should get response string after http request finished");
}

- (void)test_Should_Get_Response_String_After_Http_Request_Failed {
    [request setDelegate:self];
    [request requestFailed:self];

    STAssertEqualObjects(request.responseString, [self responseString], @"should get response string after http request failed");
}

- (void)test_Should_Parse_Response_String_And_Find_Error {

}

- (void)requestFinished:(VKRequest *)aRequest {
    requestFinished = YES;
}

- (void)requestFailed:(VKRequest *)aRequest {
    requestFinished = YES;
}

- (void)tearDown {
    [super tearDown];
    [request release];
}

- (NSString *)responseString {
    return @"test_response_string";
}

@end