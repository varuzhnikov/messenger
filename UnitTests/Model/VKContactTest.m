//
//  Created by Vitaliy Ruzhnikov on 20.04.12.
//
//
//


#import "VKContactTest.h"
#import "VKContact.h"


@implementation VKContactTest {

}

- (void)setUp {
    [super setUp];
    contact = [[VKContact alloc] init];
}

- (void)tearDown {
    [contact release];
    [super tearDown];
}

- (void)test_Should_Return_Full_Name {
    contact.firstName = @"Ivan";
    contact.lastName = @"Ivanov";

    STAssertEqualObjects(contact.fullName, @"Ivan Ivanov", @"");
}

- (void)test_Should_Return_Full_Name_Only_From_First_Name_If_Last_Name_Is_Omit {
    contact.firstName = @"Ivan";

    STAssertEqualObjects(contact.fullName, @"Ivan", @"");
}

- (void)test_Should_Return_Full_Name_Only_From_Last_Name_If_First_Name_Is_Omit {
    contact.lastName = @"Ivanov";

    STAssertEqualObjects(contact.fullName, @"Ivanov", @"");
}

- (void)test_Should_Return_Empty_Full_Name_If_First_Name_And_Last_Name_Are_Omit {
    STAssertEqualObjects(contact.fullName, @"", @"");
}

- (void)test_Should_Return_Full_Name_Only_From_First_Name_If_Last_Name_Is_Empty {
    contact.firstName = @"Ivan";
    contact.lastName = @"";

    STAssertEqualObjects(contact.fullName, @"Ivan", @"");
}

- (void)test_Should_Return_Full_Name_Only_From_Last_Name_If_First_Name_Is_Empty {
    contact.firstName = @"";
    contact.lastName = @"Ivanov";

    STAssertEqualObjects(contact.fullName, @"Ivanov", @"");
}

- (void)test_Should_Return_Empty_Full_Name_If_First_Name_And_Last_Name_Are_Empty {
    contact.firstName = @"";
    contact.lastName = @"";

    STAssertEqualObjects(contact.fullName, @"", @"");
}

- (void)test_Should_Return_Empty_Full_Name_If_First_Name_Is_Empty_But_Last_Name_Is_Omit {
    contact.firstName = @"";

    STAssertEqualObjects(contact.fullName, @"", @"");
}


- (void)test_Should_Return_Empty_Full_Name_If_First_Name_Is_Omit_But_Last_Name_Is_Empty {
    contact.lastName = @"";

    STAssertEqualObjects(contact.fullName, @"", @"");
}






@end