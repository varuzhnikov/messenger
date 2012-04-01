//
//  Created by Vitaliy Ruzhnikov on 15.03.12.
//
//
//





#import <SenTestingKit/SenTestingKit.h>
#import "VKRequestDelegate.h"

@class VKRequest;
@class HttpRequestStub;
static NSString *const URL_STRING = @"http://google.com";
static NSString *const QUERY_PARAM_NAME = @"query";
static NSString *const QUERY_PARAM_VALUE = @"ios";
static NSString *const ANOTHER_PARAM_NAME = @"anotherParam";
static NSString *const ANOTHER_PARAM_VALUE = @"anotherValue";
static NSString *const PARAM_NAME_WITH_WHITE_SPACE = @"param_with_white_space";

@interface VKRequestTest : SenTestCase <VKRequestDelegate> {
    VKRequest *request;
    BOOL requestFinished;
    BOOL requestFailed;
    NSError *responseError;
}

@property(nonatomic, copy) NSString *responseString;
@property(nonatomic, retain) NSError *responseError;
@property(nonatomic, retain) HttpRequestStub *httpRequestStub;



@end