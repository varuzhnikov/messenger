//
//  Created by Vitaliy Ruzhnikov on 02.04.12.
//
//
//


#import "VKContactsRetriever.h"
#import "OxICContainer.h"
#import "VKRequestSender.h"
#import "VKRequest.h"
#import "VKContactsRequest.h"
#import "VKContactsRetrieverDelegate.h"
#import "VKErrorNotifier.h"


@implementation VKContactsRetriever {

@private
    id <VKRequestSender> _requestSender;
    id<VKContactsRetrieverDelegate> _delegate;
    id <VKErrorNotifier> _errorNotifier;
    VKRequest *_request;
}
IoCName(contactsRetriever)
IoCSingleton
IoCLazy

IoCInject(requestSender, requestSender )
@synthesize requestSender = _requestSender;

IoCInject(errorNotifier, errorNotifier)
@synthesize errorNotifier = _errorNotifier;

@synthesize contacts = _contacts;
@synthesize delegate = _delegate;
@synthesize request = _request;


- (void)dealloc {
    self.requestSender = nil;
    [_contacts release];
    [_delegate release];
    [_errorNotifier release];
    self.request = nil;
    [super dealloc];
}



- (void)retrieveContacts {
    _request = [[VKContactsRequest alloc] init];
    self.request.delegate = self;
    [self.requestSender sendRequest:self.request];
}

- (void)requestFailed:(VKRequest *)request {
    self.request = nil;
}

- (void)requestFinished:(VKRequest *)aRequest {
    VKContactsRequest *request = (VKContactsRequest *)aRequest;
    self.contacts = request.contacts;
    [self.delegate retrievedContacts];
    self.request = nil;
}


@end