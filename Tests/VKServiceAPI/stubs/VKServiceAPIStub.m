//
//  Created by Vitaliy Ruzhnikov on 16.03.12.
//
//
//


#import "VKServiceAPIStub.h"
#import "OxICContainer.h"
#import "VKLoginRequest.h"


@implementation VKServiceAPIStub {

@private
    NSString *_token;
}
@synthesize token = _token;

IoCName(serviceAPI)
IoCSingleton
IoCLazy

- (void)sendRequest:(VKRequest *)request {

    VKLoginRequest *loginRequest = (VKLoginRequest *) request;
    NSLog(@"username :%@", loginRequest.login);
    NSLog(@"password :%@", loginRequest.password);
    if (([loginRequest.login isEqualToString:@"username"]) && ([loginRequest.password isEqualToString:@"password"])) {
        [request requestFinished:nil];
    } else {
        self.token = @"";
    }
}


@end