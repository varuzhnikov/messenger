//
//  VKContactsListViewController.m
//  vkmessenger
//
//  Created by Виталий on 18.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VKContactsListViewController.h"
#import "VKContact.h"

@interface VKContactsListViewController ()

@end

@implementation VKContactsListViewController {
@private
    NSMutableArray *_stubContacts;
}

@synthesize toolbar;
@synthesize stubContacts = _stubContacts;
@synthesize contactsTableView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

    }
    return self;
}

- (void)viewDidLoad {
    self.stubContacts = [[[NSMutableArray alloc] init] autorelease];

    VKContact *contactAlena = [[[VKContact alloc] init] autorelease];
    contactAlena.nickname = @"Алена";

    VKContact *contactAndrew = [[[VKContact alloc] init] autorelease];
    contactAndrew.nickname = @"Андрей";
    contactAndrew.firstName = @"Андрей";
    contactAndrew.lastName = @"Рогозов";


    VKContact *contactJenny = [[[VKContact alloc] init] autorelease];
    contactJenny.nickname = @"Дженни";

    VKContact *contactIgor = [[[VKContact alloc] init] autorelease];
    contactIgor.nickname = @"Игорь";

    VKContact *contactKomai = [[[VKContact alloc] init] autorelease];
    contactKomai.nickname = @"Комай";
    contactKomai.firstName = @"Мария";
    contactKomai.lastName = @"Кожанова";

    VKContact *contactRate = [[[VKContact alloc] init] autorelease];
    contactRate.nickname = @"Крысюк";

    [_stubContacts addObject:contactAlena];
    [_stubContacts addObject:contactAndrew];
    [_stubContacts addObject:contactJenny];
    [_stubContacts addObject:contactIgor];
    [_stubContacts addObject:contactKomai];
    [_stubContacts addObject:contactRate];


    [super viewDidLoad];

    NSString *kHeaderBackgroundImageName = @"Header.png";


    if ([[[UIDevice currentDevice] systemVersion] intValue] >= 5) {
        [toolbar setBackgroundImage:[UIImage imageNamed:kHeaderBackgroundImageName] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    } else {
        [toolbar insertSubview:[[[UIImageView alloc] initWithImage:[UIImage imageNamed:kHeaderBackgroundImageName]] autorelease] atIndex:0];
    }

    UIView *basicView = [toolbar.subviews objectAtIndex:0];
    basicView.backgroundColor = [UIColor blackColor];
}


- (void)viewDidUnload {
    [self setToolbar:nil];

    [self setContactsTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_stubContacts count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";


    UITableViewCell *cell = [self.contactsTableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier] autorelease];

    }

    VKContact *contact = [_stubContacts objectAtIndex:(NSUInteger) indexPath.row];

    NSLog(@"Full name %@", contact.fullName);

    cell.textLabel.text = contact.nickname;
    cell.detailTextLabel.text = contact.fullName;


    return cell;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [[UILocalizedIndexedCollation currentCollation] sectionIndexTitles];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[[UILocalizedIndexedCollation currentCollation] sectionIndexTitles] objectAtIndex:section];

}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:index];

}


- (void)dealloc {
    [toolbar release];
    [_stubContacts release];
    [contactsTableView release];
    [super dealloc];
}
@end
