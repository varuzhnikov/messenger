//
//  Created by Vitaliy Ruzhnikov on 30.04.12.
//
//
//


#import "VKContactsListScreen.h"
#import "OxICContainer.h"
#import "VKContactsRetriever.h"
#import "VKContact.h"


@implementation VKContactsListScreen {

@private
    VKContactsRetriever *_contactsRetriever;
    NSArray *_contacts;
}


IoCName(contactsListScreen)
IoCSingleton
IoCLazy

IoCInject(contactsRetriever, contactsRetriever)
@synthesize contactsRetriever = _contactsRetriever;

- (void)retrievedContacts {
    _contacts = [_contactsRetriever.contacts retain];
}

- (void)dealloc {
    [_contactsRetriever release];
    [super dealloc];
}

- (void)startDownloading {
    _contactsRetriever.delegate = self;
    [_contactsRetriever retrieveContacts];
}

- (NSUInteger)contactsCount {
    return [_contacts count];

}

- (VKContact *)objectAtIndexPath:(NSIndexPath *)indexPath {
    return [_contacts objectAtIndex:[indexPath row]];
}
@end