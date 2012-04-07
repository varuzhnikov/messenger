//
//  Created by Vitaliy Ruzhnikov on 02.04.12.
//
//
//


#import "VKContactsRetrieverTest.h"
#import "VKContactsRetriever.h"
#import "OxICContainer.h"
#import "VKUnitTestContainer.h"
#import "VKErrorNotifier.h"
#import "VKErrorNotifierStub.h"
#import "VKRequestSender.h"
#import "VKRequestSenderStub.h"


@implementation VKContactsRetrieverTest {

}

- (void)setUp {
    [super setUp];
    retriever = [self.container getObject:@"contactsRetriever"];
    _errorNotifier = [self.container getObject:@"errorNotifier"];
    _requestSender = [self.container getObject:@"requestSender"];
    retriever.delegate = self;
    _requestSender.token = TEST_TOKEN;
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_Should_Init_Contacts_Retriever {
    STAssertNotNil(retriever, @"should init contacts retriever");
}

- (void)test_Should_Init_Contacts_Retriever_With_Request_Sender {
    STAssertNotNil(retriever.requestSender, @"should init contacts retriever with request sender");
}

- (void)test_Should_Retrieve_Contacts_From_Server {
    [retriever retrieveContacts];

    NSUInteger expectedContactsCount = 1;
    STAssertEquals([retriever.contacts count], expectedContactsCount, @"should retrieve contacts from server");
}

- (void)test_Should_Notify_Delegate_About_Successful_Retrieving {
    NSLog(@"request sender token %@", _requestSender.token);
    [retriever retrieveContacts];

    STAssertTrue(contactsRetrieved, @"should notify delegate about successful retrieving");
}

- (void)test_Error_Notifier_Property_Should_Be_Initialized {
    STAssertNotNil(retriever.errorNotifier, @"error notifier should be initialized");
}

//- (void)test_Contacts_Retriever_Should_Notify_Error_Notifier_After_Failed_Retrieving {
//    _requestSender.token = nil;
//    [retriever retrieveContacts];
//}

- (void)retrievedContacts {
    contactsRetrieved = YES;
}


@end