//
//  Created by Vitaliy Ruzhnikov on 12.03.12.
//
//
//


#import "VKServiceAPITest.h"
#import "ASIHTTPRequest.h"
#import "VKServiceAPIImpl.h"
#import "VKLoginRequest.h"


@implementation VKServiceAPITest {

}

- (void)setUp {
    [super setUp];
}

-(void) testGetAccessToken{
//    _request  = [[VKLoginRequest alloc] initWithLogin:@"denis.tarazanov@gmail.com" andPassword:@"_Gu^iL@D"];
//    NSLog(@"urlString : %@", [_request.url absoluteString]);
//    [_request setDelegate:self];
//
//    VKServiceAPIImpl *serviceAPI = [[[VKServiceAPIImpl alloc] init] autorelease];
//    [serviceAPI sendRequest:_request];

}

- (void)requestFailed:(VKRequest *)request {
    GHAssertTrue(NO, @"failed request");
}

- (void)requestFinished:(VKRequest *)aRequest {
	NSLog(@"response string %@",[aRequest responseString]);
}

- (void)tearDown {
    [super tearDown];
    [_request release];
}


@end