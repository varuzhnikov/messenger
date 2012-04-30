//
//  VKContactsListViewController.h
//  vkmessenger
//
//  Created by Виталий on 18.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VKContactsListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (retain, nonatomic) IBOutlet UIToolbar *toolbar;
@property(nonatomic, retain) NSMutableArray *stubContacts;
@property (retain, nonatomic) IBOutlet UITableView *contactsTableView;



@end
