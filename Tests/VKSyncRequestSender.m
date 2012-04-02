//
//  Created by Vitaliy Ruzhnikov on 02.04.12.
//
//
//


#import "VKSyncRequestSender.h"
#import "ASIHTTPRequest.h"
#import "OxICContainer.h"


@implementation VKSyncRequestSender {

}

IoCName(serviceAPI)
IoCSingleton
IoCLazy


- (void)startRequest:(ASIHTTPRequest *)asiHttpRequest {
    [asiHttpRequest startSynchronous];
}


@end