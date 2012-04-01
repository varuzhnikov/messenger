//
//  Created by Vitaliy Ruzhnikov on 30.03.12.
//
//
//


#import "VKErrorNotifierStub.h"
#import "OxICContainer.h"


@implementation VKErrorNotifierStub {

@private
    NSError *_lastError;
}
@synthesize lastError = _lastError;

IoCName(errorNotifier)
IoCSingleton
IoCLazy


- (void)notifyWithError:(NSError *)error {
    self.lastError = error;
}


- (void)dealloc {
    [_lastError release];
    [super dealloc];
}


@end