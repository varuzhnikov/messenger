//
//  Created by Vitaliy Ruzhnikov on 02.04.12.
//
//
//


#import "VKContactsRequestTest.h"
#import "VKContactsRequest.h"
#import "VKContact.h"
#import "VKContactCreator.h"


@interface VKContactsRequestTest ()
- (void)assertContacts:(VKContact *)actualContact expectedContact:(VKContact *)expectedContact;

@end

@implementation VKContactsRequestTest {

}

- (void)setUp {
    [super setUp];
    request = [[VKContactsRequest alloc] init];
}

- (void)tearDown {
    [request release];
    [super tearDown];
}


- (void)test_Should_Create_With_Base_Url_Vkontakte_For_Methods {
    STAssertEqualObjects([[request baseUrl] absoluteString], METHOD_URL, @"should create with base url vkontakte ");
}

- (void)test_Should_Create_With_Initialized_Fields_Get_Param {
    NSString *fieldsValue = [request getParameterWithName:FIELDS_PARAM_NAME];
    STAssertEqualObjects(fieldsValue, FIELDS_PARAM_VALUE, @"should create with initialized fields get param");
}

- (void)test_Should_Parse_Zero_Contacts_From_Empty_Response {
    request.responseString = @"{\"response\":[]}";
    NSArray *contacts = request.contacts;

    NSUInteger expectedContactsCount = 0;
    STAssertEquals([contacts count], expectedContactsCount, @"should parse zero friends from empty response");
}

- (void)test_Should_Parse_One_Contact_From_Response {
    request.responseString = @"{\"response\":[{\"uid\":91345978,\"first_name\":\"Виталий\",\"last_name\":\"Ружников\",\"nickname\":\"\",\"photo\":\"http:\\/\\/cs5128.userapi.com\\/u91345978\\/e_5f1b7c70.jpg\",\"online\":1}]}";


    NSUInteger expectedContactsCount = 1;
    STAssertEquals([request.contacts count], expectedContactsCount, @"should parse one friend from response");
}

- (void)test_Should_Parse_Contacts_From_Response {
    request.responseString = @"{\"response\":[{\"uid\":3792038,\"first_name\":\"Антон\",\"last_name\":\"Катков\",\"photo\":\"http:\\/\\/cs108.userapi.com\\/u3792038\\/e_f81068d1.jpg\",\"online\":0},"
            "{\"uid\":91345978,\"first_name\":\"Виталий\",\"last_name\":\"Ружников\",\"photo\":\"http:\\/\\/cs5128.userapi.com\\/u91345978\\/e_5f1b7c70.jpg\",\"online\":1}]}";


    NSUInteger expectedContactsCount = 2;
    STAssertEquals([request.contacts count], expectedContactsCount, @"should parse one friend from response");
}

- (void)test_Should_Parse_Contact_With_Full_Info {
    request.responseString = @"{\"response\":[{\"uid\":91345978,\"first_name\":\"Виталий\",\"last_name\":\"Ружников\",\"nickname\":\"\",\"photo\":\"http:\\/\\/cs5128.userapi.com\\/u91345978\\/e_5f1b7c70.jpg\",\"online\":1}]}";

    VKContact *actualContact = [request.contacts lastObject];
    VKContact *expectedContact = [VKContactCreator createContact];

    [self assertContacts:actualContact expectedContact:expectedContact];
}

- (void)test_Should_Parse_Offline_Contact {
    request.responseString = @"{\"response\":[{\"uid\":91345978,\"first_name\":\"Виталий\",\"last_name\":\"Ружников\",\"nickname\":\"\",\"photo\":\""
            "http:\\/\\/cs5128.userapi.com\\/u91345978\\/e_5f1b7c70.jpg\",\"online\":0}]}";

    VKContact *contact = [request.contacts lastObject];
    STAssertFalse(contact.online, @"should parse online status");
}

- (void)assertContacts:(VKContact *)actualContact expectedContact:(VKContact *)expectedContact {
    STAssertEquals(actualContact.uid, expectedContact.uid, @"should parse uid");
    STAssertEqualObjects(actualContact.firstName, expectedContact.firstName, @"should parse first name");
    STAssertEqualObjects(actualContact.lastName, expectedContact.lastName, @"should parse last name");
    STAssertEqualObjects(actualContact.nickname, expectedContact.nickname, @"should parse nickname");
    STAssertEqualObjects(actualContact.photoUrl, expectedContact.photoUrl, @"should parse photo url");
    STAssertEquals(actualContact.online, expectedContact.online, @"should parse online status");
}


@end