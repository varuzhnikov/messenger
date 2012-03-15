//
//  Created by Vitaliy Ruzhnikov on 15.03.12.
//
//
//


#import "VKRequestTest.h"
#import "VKRequest.h"


@implementation VKRequestTest {

}

- (void)setUp {
    [super setUp];
    request = [[VKRequest alloc] initWithUrlString:URL_STRING];
}

- (void)test_Should_Create_Request_With_Url_String {

    GHAssertEqualStrings([request.url absoluteString], URL_STRING, @"Should create request with url string");
}

- (void)test_Should_Add_Parameter_In_Get_Manner {
    [request setGetParameterWithName:QUERY_PARAM_NAME andValue:QUERY_PARAM_VALUE];

    NSString *expectedString = [NSString stringWithFormat:@"%@?%@=%@", URL_STRING, QUERY_PARAM_NAME, QUERY_PARAM_VALUE];
    NSLog(@"expected string: %@", expectedString);
    GHAssertEqualStrings([request.url absoluteString], expectedString, @"should add parameter in get manner");
}

- (void)test_Should_Add_Parameter_With_Name_And_Value {
    [request setGetParameterWithName:QUERY_PARAM_NAME andValue:QUERY_PARAM_VALUE];

    GHAssertEqualStrings([request getParameterWithName:QUERY_PARAM_NAME], QUERY_PARAM_VALUE, @"should add parameter with name and value");
}

- (void)test_Should_Insert_Delimiter_Between_Params {
    [request setGetParameterWithName:QUERY_PARAM_NAME andValue:QUERY_PARAM_VALUE];
    [request setGetParameterWithName:ANOTHER_PARAM_NAME andValue:ANOTHER_PARAM_VALUE];

    NSString *expectedString = [NSString stringWithFormat:@"%@?%@=%@&%@=%@", URL_STRING, ANOTHER_PARAM_NAME, ANOTHER_PARAM_VALUE,
                                                          QUERY_PARAM_NAME, QUERY_PARAM_VALUE
    ];
    NSLog(@"expected string: %@", expectedString);
    GHAssertEqualStrings([request.url absoluteString], expectedString, @"should insert delimeter between params");
}

- (void)test_Should_Correct_Encode_Params_Value {
    [request setGetParameterWithName:PARAM_NAME_WITH_WHITE_SPACE andValue:@"param with white space"];

    NSString *expectedString = [NSString stringWithFormat:@"%@?%@=%@", URL_STRING, PARAM_NAME_WITH_WHITE_SPACE, @"param%20with%20white%20space"];
    NSLog(@"expected string: %@", expectedString);
    GHAssertEqualStrings([request.url absoluteString], expectedString, @"should correct encode params value");
}

- (void)tearDown {
    [super tearDown];
    [request release];
}


@end