//
//  Created by Vitaliy Ruzhnikov on 30.04.12.
//
//
//


#import "VKContactsListScreenTest.h"
#import "VKContactsListScreen.h"
#import "OxICContainer.h"
#import "VKUnitTestContainer.h"
#import "VKContactsRetrieverStub.h"
#import "VKContactsCreator.h"
#import "VKContact.h"


@implementation VKContactsListScreenTest {

}

- (void)setUp {
    [super setUp];
    _contactsScreen = [self.container getObject:@"contactsListScreen"];
    _contactsScreen.contactsRetriever = [[[VKContactsRetrieverStub alloc] init] autorelease];
}

- (void)tearDown {
    [_contactsScreen release];
    [super tearDown];
}

- (void)test_Should_Initialize_Contacts_List_Screen {
    STAssertNotNil(_contactsScreen, @"should initialize contacts list screen");
    STAssertNotNil(_contactsScreen.contactsRetriever, @"contactsRetriever property should be initialized");
}

- (void)test_Should_Get_Contacts_From_Service {
    [_contactsScreen startDownloading];

    STAssertEquals([_contactsScreen contactsCount], [[VKContactsCreator createContacts] count], @"should get contacts from service");
}

- (void)test_Should_Get_First_Contact {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    NSString *expectedContactName = [[[VKContactsCreator createContacts] objectAtIndex:0] fullName];

    [_contactsScreen startDownloading];

    VKContact *contact = [_contactsScreen objectAtIndexPath:indexPath];
    NSString *actualContactName = contact.fullName;
    STAssertEqualObjects(expectedContactName, actualContactName, @"should get first contact");
}




@end