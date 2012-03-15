//
//  Created by Vitaliy Ruzhnikov on 15.03.12.
//
//
//





#import <GHUnitIOS/GHTestCase.h>

@class VKRequest;
static NSString *const URL_STRING = @"http://google.com";
static NSString *const QUERY_PARAM_NAME = @"query";
static NSString *const QUERY_PARAM_VALUE = @"ios";
static NSString *const ANOTHER_PARAM_NAME = @"anotherParam";
static NSString *const ANOTHER_PARAM_VALUE = @"anotherValue";

@interface VKRequestTest : GHTestCase {
    VKRequest *request;
}
@end