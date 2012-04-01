//
//  Created by Vitaliy Ruzhnikov on 30.03.12.
//
//
//


#import "VKErrorNotifierImpl.h"
#import "OxICContainer.h"


@implementation VKErrorNotifierImpl {

}

IoCName(errorNotifier)
IoCSingleton
IoCLazy

- (void)notifyWithError:(NSError *)error {
    NSString *message = [error localizedDescription];
    if (message == nil)  {
        message = @"Problem with network";
    }
    UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlertView show];
    [errorAlertView release];
}


@end