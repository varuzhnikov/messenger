//
//  Created by Vitaliy Ruzhnikov on 02.04.12.
//
//
//


#import <Foundation/Foundation.h>
#import "VKRequestSender.h"

@class ASIHTTPRequest;


@interface VKAbstractRequestSender : NSObject<VKRequestSender>

- (void)startRequest:(ASIHTTPRequest *)asiHttpRequest;
@end