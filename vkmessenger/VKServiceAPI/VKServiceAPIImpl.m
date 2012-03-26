//
//  Created by Vitaliy Ruzhnikov on 15.03.12.
//
//
//


#import "VKServiceAPIImpl.h"
#import "VKRequest.h"
#import "ASIHTTPRequest.h"
#import "OxICContainer.h"


@implementation VKServiceAPIImpl {

@private
    id _token;
}
@synthesize token = _token;

- (void)sendRequest:(VKRequest *)request {
    ASIHTTPRequest *asiHttpRequest = [ASIHTTPRequest requestWithURL:request.url];

    [asiHttpRequest setDelegate:request];

    [asiHttpRequest startSynchronous];
}

- (NSString *)token {
    return nil;
}

- (void)dealloc {
    [_token release];
    [super dealloc];
}

@end