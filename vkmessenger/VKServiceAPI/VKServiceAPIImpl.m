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


IoCName(serviceAPI)
IoCSingleton
IoCLazy

- (void)sendRequest:(VKRequest *)request {
    ASIHTTPRequest *asiHttpRequest = [ASIHTTPRequest requestWithURL:request.url];

    NSLog(@"send request by url: %@", [request.url absoluteString]);

    [asiHttpRequest setDelegate:request];

    [asiHttpRequest startSynchronous];
}

- (void)dealloc {
    [_token release];
    [super dealloc];
}

@end