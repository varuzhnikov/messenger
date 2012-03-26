//
//  Created by Vitaliy Ruzhnikov on 12.03.12.
//
//
//


#import <Foundation/Foundation.h>
#import <GHUnitIOS/GHAsyncTestCase.h>
#import "VKRequestDelegate.h"

@class ASIHTTPRequest;


@interface VKServiceAPITest : GHAsyncTestCase<VKRequestDelegate>  {
    VKRequest *_request;
}

@end