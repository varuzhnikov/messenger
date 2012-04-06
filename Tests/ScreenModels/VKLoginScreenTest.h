//
//  Created by Vitaliy Ruzhnikov on 29.03.12.
//
//
//


#import <Foundation/Foundation.h>
#import <SenTestingKit/SenTestingKit.h>
#import "VKUnitTestContainerTestCase.h"
#import "VKLoginScreenDelegate.h"

@class VKLoginScreen;


@interface VKLoginScreenTest : VKUnitTestContainerTestCase <VKLoginScreenDelegate> {
    VKLoginScreen *_loginScreen;
    BOOL enteredInApplication;
    BOOL stoppedWait;
    BOOL startedWait;
}
@end