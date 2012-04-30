//
//  Created by Vitaliy Ruzhnikov on 30.04.12.
//
//
//


#import "VKContactsRetrieverStub.h"
#import "VKContactsRetrieverDelegate.h"
#import "VKContact.h"
#import "VKContactsCreator.h"


@implementation VKContactsRetrieverStub {

}

- (void)retrieveContacts {
    self.contacts = [VKContactsCreator createContacts];

    [self requestFinished:nil];
}

- (void)requestFinished:(VKRequest *)request {
    [self.delegate retrievedContacts];
}


@end