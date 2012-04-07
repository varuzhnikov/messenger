//
//  Created by Vitaliy Ruzhnikov on 06.04.12.
//
//
//


#import "VKContactsRetrieverIntegrationTest.h"
#import "OxICContainer.h"
#import "VKIntegrationTestContainer.h"
#import "VKContactsRetriever.h"
#import "VKAuthenticator.h"


@interface VKContactsRetrieverIntegrationTest ()
- (void)should_Retrieve_Contacts_From_Server;

@end

@implementation VKContactsRetrieverIntegrationTest {

}

- (void)setUp {
    [super setUp];
    _contactsRetriever = [self.container getObject:@"contactsRetriever"];
    _authenticator = [self.container getObject:@"authenticator"];
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_Should_Get_Contacts_Retriever_From_IoC_Container {
    GHAssertNotNil(_contactsRetriever, @"should get contacts retriever from IoC container");
}

- (void)test_Should_Retrieve_Contacts_From_Server {
    _authenticator.delegate = self;
    [_authenticator loginWithUsername:@"denis.tarazanov@gmail.com" andPassword:@"_Gu^iL@D"];
}

- (void)loginFinished {
    [self should_Retrieve_Contacts_From_Server];
}

- (void)should_Retrieve_Contacts_From_Server {
    _contactsRetriever.delegate = self;
    [_contactsRetriever retrieveContacts];
}


- (void)loginFailed {
    NSLog(@"failed login");
}

- (void)retrievedContacts {
    NSLog(@"retrieved contacts");

    NSUInteger zero = 0;
    GHAssertNotEquals(_contactsRetriever.contacts.count, zero, @"should retrieve bot contacts");
}



@end