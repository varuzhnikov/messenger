//
//  Created by Vitaliy Ruzhnikov on 16.03.12.
//
//
//


#import <Foundation/Foundation.h>
#import <SenTestingKit/SenTestingKit.h>

@class VKLoginRequest;
static NSString *const TEST_PASSWORD = @"test_password";
static NSString *const TEST_LOGIN = @"test_login";

@interface VKLoginRequestTest : SenTestCase {
    VKLoginRequest *request;
}
@end