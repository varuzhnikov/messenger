//
//  Created by Vitaliy Ruzhnikov on 15.03.12.
//
//
//


#import "VKAsyncRequestSender.h"
#import "ASIHTTPRequest.h"
#import "OxICContainer.h"


@interface VKAsyncRequestSender ()

@end

@implementation VKAsyncRequestSender {
}


IoCName(httpRequestSender)
IoCSingleton
IoCLazy



- (void)startRequest:(ASIHTTPRequest *)asiHttpRequest {
    [asiHttpRequest startAsynchronous];
}

@end